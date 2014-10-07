#!/usr/bin/env perl6

use Inline::Perl5;

my $p5 = Inline::Perl5.new;

$p5.use('Petal');
my $template = $p5.invoke('Petal', 'new', 'bars.xhtml');
say $template.process({
    city => 'Linz',
    bars => <Chelsea Walker Bugs>,
});

# vim: ft=perl6
