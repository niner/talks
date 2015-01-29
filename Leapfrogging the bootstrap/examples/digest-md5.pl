#!perl6

use Inline::Perl5; 
use Digest::MD5:from<Perl5>;

our &md5 := &Digest::MD5::md5;

say md5('foo');

# vim: ft=perl6
