#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;

# /foo/test
# /foo/test123
get '/foo/:bar' => sub ($c) {
    my $bar = $c.stash('bar');
    $c.render(text => "Our :bar placeholder matched $bar");
};
 
# /testsomething/foo
# /test123something/foo
get '/(:bar)something/foo' => sub ($c) {
    my $bar = $c.param('bar');
    $c.render(text => "Our :bar placeholder matched $bar");
};
 
app.start;
