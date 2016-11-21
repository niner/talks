#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;

# Modify the received JSON document and return it
put '/reverse' => sub ($c) {
  my $hash = $c.req.json;
  $hash<message> = flip $hash<message>;
  $c.render(json => $hash);
};
 
app.start;
