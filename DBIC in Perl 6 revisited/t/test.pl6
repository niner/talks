use Atikon::DB::Timemngt:from<Perl5>;
use SQL;

my $schema = Atikon::DB::Timemngt.connect("dbi:Pg:database=timemngt");

my $articles = $schema.resultset('Article');

my $name = "Homepage";
my $active = 2;

my $homepage = $articles.search_rs(
    where(sql{"name=$name and active=$active"})
).single;

say $homepage.id;

$homepage = $articles.where(sql{"name=$name and active=$active"}).single;

say $homepage.id;

$homepage = $articles.where({"name=$name and active=$active"}).single;

say $homepage.id;

$homepage = ($articles where {"name=$name and active=$active"}).single;
say $homepage.id;

# vim: ft=perl6
