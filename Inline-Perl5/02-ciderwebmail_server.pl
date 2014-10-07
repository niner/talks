#!/usr/bin/env perl6

use Inline::Perl5;

%*ENV<CATALYST_SCRIPT_GEN> = 40;

my $p5 = Inline::Perl5.new;

$p5.run(q:heredoc/PERL5/);
    use lib qw(lib);
PERL5

$p5.use('Catalyst::ScriptRunner');
$p5.invoke('Catalyst::ScriptRunner', 'run', 'CiderWebmail', 'Server');

# vim: ft=perl6
