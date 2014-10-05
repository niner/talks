
use Inline Python => <<END;
from robotparser import RobotFileParser
END

my $parser = RobotFileParser->new();

$parser->set_url(
    'http://niner.name/robots.txt');

$parser->read();

say 'fetch on!'
    if $parser->can_fetch('*',
        'http://niner.name/talks/');

