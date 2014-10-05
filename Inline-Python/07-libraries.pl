
use Inline Python => <<END;

import os

def orig_path():
    return os.defpath.split(os.pathsep)

END

say foreach @{ orig_path() };
