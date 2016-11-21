#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;
 
# /foo?user=sri
get '/foo' => sub ($c) {
  my $user = $c.param: 'user';
  $c.render: text => "Hello $user.";
}
 
app.start;
