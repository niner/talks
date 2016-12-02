use strict;
use warnings;
use Test::More;


use Catalyst::Test 'XStats';
use XStats::Controller::Graph;

ok( request('/graph')->is_success, 'Request should succeed' );
done_testing();
