use common::sense;
use Plack::Test;
use HTTP::Request::Common;
use DancrP5;
use Time::HiRes qw(time);

my $start = time;
my $test = Plack::Test->create( Dancr->to_app );
for (1 .. 1000) {
    my $response = $test->request( GET '/' );
}
say time - $start;
