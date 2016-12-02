grammar Awstats {
    token TOP {
        <header>
        <body>
    }
    token header {
        ^AWSTATS .*? $$ \n?
    }
    token body {
        [
            <.comment>
            | <.empty>
            | <block>
        ]+
    }
    token comment {
            [
            ^^
            '#'
            \N*
            $$
            \n?
            ]+
    }
    token empty {
        ^^ $$ \n?
    }
    token block {
        BEGIN_(<name>) <.ws>*? \d* \n
        <line>*?
        END_$0 \n?
    }
    token name {
        \w+
    }
    token line {
        ^^ <name> (\N*) $$ \n?
    }
}

my $content = 'awstats.txt'.IO.slurp;
say Awstats.parsefile('awstats.txt');

# vim: ft=perl6
