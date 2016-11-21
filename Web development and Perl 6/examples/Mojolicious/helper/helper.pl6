#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;

# A helper to identify visitors
helper whois => sub ($c) {
    my $agent = $c.req.headers.user_agent || 'Anonymous';
    my $ip    = $c.tx.remote_address;
    return "$agent ($ip)";
};
 
# Use helper in action and template
get '/secret' => sub ($c) {
    my $user = $c.whois;
    $c.app.log.debug("Request from $user");
};
 
app.start;
