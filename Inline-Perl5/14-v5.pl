

    {
        use v5;
        if( $^O eq 'MSWin32' ) {
            say $0 # Perl 5's special variable for program name
        }

        {
            use 6.0.0;
            multi sub foo(*@args) {
                ...
            }
        }
    }
    # $*DISTRO is a Perl 6's "special variable"
    say "Back to Perl 6 on a $*DISTRO.name box."
