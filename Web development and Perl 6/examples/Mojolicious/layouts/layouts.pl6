#!/usr/bin/env perl6

use Mojolicious::Lite:from<Perl5>;

get '/with_layout';
 
app.start;
