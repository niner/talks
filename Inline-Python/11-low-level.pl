
use Inline::Python qw(
    py_eval
    py_call_function
    py_bind_class
    py_new_object
);

py_eval('import webbrowser');
py_call_function('webbrowser', 'open',
    'http://niner.name/talks');
py_bind_class('WWW::RobotFile::Parser',
    'robotparser', 'RobotFileParser');

say py_eval('1 + 2', 0);
