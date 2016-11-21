#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;

# Render the template "index.html.ep"
get '/' => sub ($c) {
  $c.render;
}, 'index'; #Talk: Don't use => here!
 
# Render the template "hello.html.ep"
get '/hello';
 
app.start;
