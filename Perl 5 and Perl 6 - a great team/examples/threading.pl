use Inline::Perl5;

my @p5 = Inline::Perl5.new xx 10;

my @promises = @p5.kv.map: -> $i, $p5 {
    start {
        $p5.run("
            use 5.10.0;
            sleep $i;
            say 'hello world: $i';
            $i
        ");
    }
};

say "awaiting";
say [+] await @promises;

# vim: ft=perl6

