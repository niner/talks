#!/usr/bin/env perl6

use v6;
use Inline::Python;

my $py = Inline::Python.new();

$py.run(q:heredoc/PYTHON/);
    import PyQt4
    import PyQt4.QtCore
    import PyQt4.QtGui
    PYTHON

constant YES     = 0x00004000;
constant DEFAULT = 0x00010000;

class MessageBox does Inline::Python::PythonParent['PyQt4.QtGui', 'QWidget'] {
    method setup() {
        self.resize(250, 150);
        self.setWindowTitle('message box');
        self.show();
        self.center();
    }
    method closeEvent($event) {
        my $reply = $py.invoke(
            'PyQt4.QtGui',
            'QMessageBox',
            'question',
            $.parent,
            'Message',
            'Are you sure to quit?',
            YES,
            DEFAULT,
        );
        $reply == YES ?? $event.accept !! $event.ignore;
    }
    method mousePressEvent($event) {
        $event.accept;
    }
    method center() {
        my $qr = self.frameGeometry();
        my $cp = $py.call('PyQt4.QtGui', 'QDesktopWidget').availableGeometry().center();
        $qr.moveCenter($cp);
        self.move($qr.topLeft());
    }
}

my $app = $py.call('PyQt4.QtGui', 'QApplication', ['pyqt4.t']);
my $message_box = MessageBox.new;
$message_box.setup;
$app.exec_;

# vim: ft=perl6
