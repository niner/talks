my $cd = $schema.resultset('Cd').search_rs(
    {
        title => \('= artist.name'),
    },
    {
        join => 'artist',
    },
);

# vim: ft=perl6
