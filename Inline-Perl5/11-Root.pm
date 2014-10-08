package XStats::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; with 'CatalystX::Perl6::Component'; }

__PACKAGE__->config(namespace => '');

__PACKAGE__->init_metaclass;
__PACKAGE__->meta->make_immutable;

use v6-inline;

use CatalystX::Perl6::Component::Perl5Attributes;
also does Inline::Perl5::Perl5Parent['XStats::Controller::Root'];
also does CatalystX::Perl6::Component;

method index($c) is Path is Args[0] {
    $c.stash({
        template  => 'index.zpt',
        uri_graph => $c.uri_for('graph'),
    });
}

method default($c) is Path {
    $c.response.body( 'Page not found' );
    $c.response.status(404);
}

method end($c) is ActionClass["RenderView"] {
}
