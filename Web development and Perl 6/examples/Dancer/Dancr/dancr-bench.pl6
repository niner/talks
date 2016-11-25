use Plack::Test:from<Perl5>;
use HTTP::Request::Common:from<Perl5>;
use Dancr;

my $test     = Plack::Test.create( Dancr.to-app );
for ^100 {
    my $response = $test.request( GET '/' );
}
say now - INIT now;
