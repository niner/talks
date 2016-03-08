use Inline::Perl5:auth(/.*:nine/):ver(v0.2+);

CompUnit::DependencySpecification.new(
    :short-name<Inline::Perl5>,
    :auth-matcher(/.*:nine/),
    :version-matcher(v0.2+),
);

'Inline::Perl5' eq 'Inline::Perl5'
and 'cpan:nine' ~~ /.*:nine/
and v0.3 ~~ v0.2+
and 1 ~~ True
