#!/usr/bin/env perl

use Inline::Perl6;
use v6::inline;

use Mojolicious::Lite:from<Perl5>;
 
get '/' => sub ($c) {
  $c.render(text => 'Hello World!');
}
 
app.start;
