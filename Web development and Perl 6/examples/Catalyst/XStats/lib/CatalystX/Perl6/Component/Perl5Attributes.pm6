use Inline::Perl5;

multi trait_mod:<is>(Routine $declarand, :$Path!) is export {
    unless $declarand.does(Inline::Perl5::Perl5Attributes) {
        $declarand does Inline::Perl5::Perl5Attributes;
    }
    $declarand.attributes.push('Path' ~ ($Path.isa(Bool) ?? '' !! "('$Path')"));
}

multi trait_mod:<is>(Routine $declarand, :$Args!) is export {
    unless $declarand.does(Inline::Perl5::Perl5Attributes) {
        $declarand does Inline::Perl5::Perl5Attributes;
    }
    $declarand.attributes.push('Args' ~ (
        $Args.isa(Bool)
            ?? ''
            !! $Args.does(Numeric)
                ?? "($Args)"
                !! "('$Args')"
        )
    );
}

multi trait_mod:<is>(Routine $declarand, :$ActionClass!) is export {
    unless $declarand.does(Inline::Perl5::Perl5Attributes) {
        $declarand does Inline::Perl5::Perl5Attributes;
    }
    $declarand.attributes.push("ActionClass('$ActionClass')");
}
