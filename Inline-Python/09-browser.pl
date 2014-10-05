use Cwd;
use Inline Python => <<END;

from webbrowser import get as get_browser

END

my $browser = get_browser();

$browser->open_new_tab($_)
    foreach glob(cwd . '/*.txt');
