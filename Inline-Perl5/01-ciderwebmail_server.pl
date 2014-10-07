#!/usr/bin/env perl6

%*ENV<CATALYST_SCRIPT_GEN> = 40;

use Inline::Perl5;

my $p5 = Inline::Perl5.new;

$p5.run(q:heredoc/PERL5/);
    use lib qw(lib);
    use Catalyst::ScriptRunner;
    Catalyst::ScriptRunner->run('CiderWebmail', 'Server');
PERL5

# vim: ft=perl6
