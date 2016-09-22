use nqp;

class SQLValue {
    has $.str;
    method Str() {
        my $quoted = nqp::join("''", nqp::split("'", $.str.Str));
        "'" ~ $quoted ~ "'"
    }
}

multi sub infix:<~> (Str:D $str, SQLValue:D $val) is export {
    $str ~ $val.Str
}

sub prefix:<sql> (&block) is export {
    my $stringy = Str.^find_method("Stringy");
    my $handler = $stringy.wrap(sub ($self) {
        SQLValue.new(:str($self))
    });
    my $result = &block();
    $stringy.unwrap($handler);
    $result
};

grammar SQL is export {
    rule TOP {
        <equality>
        [
            'and'
            <equality>
        ]*
    }
    token equality {
        <name> '=' <value>
    }
    token name {
        \w+
    }
    token value {
        <numeric>
        |
        <stringy>
    }
    token numeric {
        \d+
    }
    token stringy {
        "'" <string_value> "'"
    }
    token string_value {
        [ \w+ | \d+ | "''" | \s+ ]+
    }
};

class SQLAbstract is export {
    method TOP($/) {
        make ['-and', $<equality>».ast].item;
    }
    method equality($/) {
        make [ $<name>.ast, $<value>.ast ]
    }
    method name($/) {
        make $/.Str
    }
    method value($/) {
        make ($<numeric> or $<stringy>.ast)
    }
    method stringy($/) {
        make $<string_value>.Str
    }
}

sub where($str) is export {
    SQL.new.parse($str, :actions(SQLAbstract.new)).ast
}

role SQLResultSet is export {
    multi method where(Str:D $str) {
        self.search_rs(SQL.new.parse($str, :actions(SQLAbstract.new)).ast)
    }

    multi method where(Callable $r) {
        self.search_rs(SQL.new.parse(sql $r, :actions(SQLAbstract.new)).ast)
    }
}

sub infix:<where>($resultset, &block) is export {
    return $resultset.where(&block);
}

# vim: ft=perl6
