class XStats::Controller::Root does Inline::Perl5::Perl5Parent['XStats::Controller::Root'];

method index($c) {
    $c.stash({
        template  => 'index.zpt',
        uri_graph => $c.uri_for('graph'),
    });
}

# vim: ft=perl6
