
use Inline Python => <<END;

from quopri import encodestring

END

print encodestring("Motörhead");
