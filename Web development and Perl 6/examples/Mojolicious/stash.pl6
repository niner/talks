#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;
 
get '/' => sub ($c) {
    $c.stash(:one<23>);
    $c.render(:template<magic>, :two<24>);
}
 
app.start;

=finish

Talk: This won't work :/ Need to use an external template
 
@@ magic.html.ep
The magic numbers are <%= $one %> and <%= $two %>.
