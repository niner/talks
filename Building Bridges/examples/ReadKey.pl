#!perl6

use Term::ReadKey:from<Perl5>;

ReadMode(4);

loop {
    my $a = ReadKey(0);

    if $a.defined {
        say $a.ord;
        last if $a eq 'q';
    }
}

ReadMode(0);
