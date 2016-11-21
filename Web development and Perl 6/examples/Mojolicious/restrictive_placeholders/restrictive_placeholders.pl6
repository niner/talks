#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;

# /1
# /123
# Talk: this just cannot work right now :/ Passing a regex seems hard
any '/:bar' => [bar => rx/\d+/], sub ($c) {
  my $bar = $c.param('bar');
  $c.render(text => "Our :bar placeholder matched $bar");
};
 
app.start;
