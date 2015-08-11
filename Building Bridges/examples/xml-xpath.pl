#!perl6

use Inline::Perl5; 
use XML::XPath:from<Perl5>;

my $xp = XML::XPath.new('xml-xpath.xml');
my $nodeset = $xp.find('//baz/@qux');
say $nodeset.get_node(1).getData;

# vim: ft=perl6
