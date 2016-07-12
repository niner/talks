use DBIC::Demo:from<Perl5>;
my $schema = DBIC::Demo.connect('dbi:Pg:dbname=nine');

$schema.resultset('Cd').delete;
$schema.resultset('Artist').delete;

my $nin = $schema.resultset('Artist').create(${
    name => 'Nine Inch Nails',
});

$nin.create_related('cds', ${
    title => 'The Downward Spiral',
});

my $cd = $schema.resultset('Cd').search_rs.first;

say $cd.full_title;

# vim: ft=perl6
