#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;

websocket '/echo' => sub ($c) {
    $c.on(json => sub ($c, $hash) {
	$hash<msg> = "echo: $hash<msg>";
	$c.send(${json => $hash});
    });
};
 
get '/' => 'index';
 
app.start;
