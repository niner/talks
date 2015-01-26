#!perl6

use Inline::Perl5; 
my $p5 = Inline::Perl5.new;
$p5.use('HTML::Parser');

class PrettyPrinter does Inline::Perl5::Perl5Parent['HTML::Parser'] {
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

    # end is some magic method in Perl 6!
    # class List (list of one and scalar are intentionally confused)
    method end($tag, *@args) {
        $!level--;
        say self.indent ~ "</$tag>";
    }

    method sink() { self } # magic
}

PrettyPrinter.new(
    perl5 => $p5,
).parse_file('html-parser.html');

# vim: ft=perl6
