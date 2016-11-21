#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;

# GET /hello
get '/hello' => sub ($c) {
    $c.render(text => 'Hello World!');
};
 
# PUT /hello
put '/hello' => sub ($c) {
    my $size = $c.req.body.chars;
    $c.render(text => "You uploaded $size bytes to /hello.");
};
 
# Talk: beware again of the second =>!
# GET|POST|PATCH /bye
any ['GET', 'POST', 'PATCH'] => '/bye', sub ($c) {
    $c.render(text => 'Bye World!');
};
 
# * /whatever
any '/whatever' => sub ($c) {
    my $method = $c.req.method;
    $c.render(text => "You called /whatever with $method.");
};
 
app.start;
