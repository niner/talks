use strict;

use PerlQt4 qw(QtGui);

package QuitMeApp;
use base qw(QtGui::QWidget);

sub new {
    my ($class, $parent) = @_;
    my $self = $class->SUPER::new($parent);

    $self->setGeometry(300, 300, 250, 150);
    $self->setWindowTitle('Quit button');

    my $quit = QtGui::QPushButton->new('Close', $self);
    $quit->setGeometry(90, 45, 60, 35);

    $self->connect($quit,
        QtCore::SIGNAL('clicked()'),
        $PerlQt4::app,
        QtCore::SLOT('quit()')
    );

    return bless $self, $class;
}

package main;

$PerlQt4::app = QtGui::QApplication->new(\@ARGV);

my $widget = QuitMeApp->new;
$widget->show();

$PerlQt4::app->exec_();




