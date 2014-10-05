package PerlQt4;

use warnings;
use strict;
use Carp;

use version; our $VERSION = qv('0.0.1');

use Inline::Python qw(py_eval py_bind_class py_bind_func py_study_package);
use Data::Dumper;

sub import {
    my ( $self, @modules ) = @_;
    push @modules, 'QtCore';

    py_eval( 'from PyQt4 import ' . join ', ', @modules );

    foreach my $package (@modules) {
        foreach ( keys %{ { py_study_package("PyQt4.$package") }->{classes} } ) {
            py_bind_class( $package . q{::} . $_, "PyQt4.$package", $_ );
        }
    }

    foreach (qw(SIGNAL SLOT)) {    # don't really know where these come from. py_study_package doesn't list them
        py_bind_func( "QtCore::$_", 'PyQt4.QtCore', $_ );
    }

    return;
}

1;                                 # Magic true value required at end of module
__END__

=head1 NAME

PerlQt4 - Wrapper around Python's PyQt4 Qt 4 bindings.


=head1 VERSION

This document describes PerlQt4 version 0.0.1


=head1 SYNOPSIS

    use PerlQt4 qw(QtGui);

    $PerlQt4::app = QtGui::QApplication->new(\@ARGV);
    $PerlQt4::app->exec_();


=head1 DESCRIPTION

    PerlQt4 is a wrapper around the PyQt4 Qt 4 bindings for Python.


=head1 INTERFACE

    use PerlQt4; loads the Qt* classes which may then be used like normal perl
    classes. Please refer to the PyQt4 documentation for full class and method
    listings:
    L<http://www.riverbankcomputing.co.uk/static/Docs/PyQt4/html/classes.html>

=head1 SUBROUTINES/METHODS

=head1 DIAGNOSTICS

=head1 CONFIGURATION AND ENVIRONMENT

PerlQt4 requires no configuration files or environment variables.


=head1 DEPENDENCIES

Inline::Python


=head1 INCOMPATIBILITIES

None reported.


=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-perlqt4@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Stefan Seifert  C<< <nine@cpan.org> >>


=head1 LICENSE AND COPYRIGHT

Copyright (c) 2009, Stefan Seifert C<< <nine@cpan.org> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENSE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
