#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;
 
# Talk: note the space before the arg list
get '/' => sub ($c) {
  $c.render(text => 'Hello World!');
}
 
app.start;
