
use Inline Python => <<END;

def foo(bar):
    return bar + 'baz' 

END

print foo('bar');
