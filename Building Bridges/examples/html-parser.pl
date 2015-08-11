#!perl6

use HTML::Parser:from<Perl5>;

class PrettyPrinter is HTML::Parser {
    has $!level = 0;

    method indent() {
        return '    ' x $!level;
    }

    method start($tag, %attrs, @attrs, $full) {
        say self.indent ~ '<' ~ $tag ~ @attrs.map({ qq/ $_="{%attrs{$_}}"/ }).join ~ '>';
        $!level++;
    }

    method text($content, *@args) {
        say $content.indent(*).trim.indent($!level * 4);
    }

    method end($tag, *@args) {
        $!level--;
        say self.indent ~ "</$tag>";
    }
}

PrettyPrinter.new.parse_file('html-parser.html');

# vim: ft=perl6
