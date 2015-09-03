use common::sense;
use Inline::Perl6;
BEGIN { Inline::Perl6::initialize };

v6::run('say <Hello from Perl6>');
v6::call('say', 'Hello from Perl6');

v6::run('class GLOBAL::MyStr { has $.value; method say() { $.value.say }; }');
v6::invoke('MyStr', 'new', v6::named value => 'Hello from Perl6')->say;

