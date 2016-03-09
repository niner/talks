#!perl6

use HTML::Parser:from<Perl5>;

my $level = 0;

sub indent { '    ' x $level }

sub start($tag, %attrs, @attrs, $full?) {
    say indent() ~ '<' ~ $tag ~ @attrs.map({ qq/ $_="{%attrs{$_}}"/ }).join ~ '>';
    $level++;
}

sub text($content, *@args) {
    say $content.indent(*).trim.indent($level * 4);
}

sub end($tag, *@args) {
    $level--;
    say indent() ~ "</$tag>";
}

HTML::Parser.new(
    api_version => 3,
    start_h => [&start, "tagname, attr, attrseq"],
    text_h  => [&text, "dtext"],
    end_h   => [&end, "tagname"],
).parse_file('html-parser.html');

# vim: ft=perl6

