use NativeCall;
sub some_function(int)
    is native('libsomething')
    { * }
some_function(42);

