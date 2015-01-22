#!perl6

use Inline::Perl5; 

my $p5 = Inline::Perl5.new;
$p5.use('Bot::BasicBot');

class P6Bot does Inline::Perl5::Perl5Parent['Bot::BasicBot'] {
    method can($method) {
        return 1;
    }

    method said(%statement) {
        self.reply($%statement, "Hullo {%statement<who>}!") if %statement<body> eq 'Hi bot!';
        self.reply($%statement, "I'm the first Perl 6 bot based on Bot::BasicBot!") if %statement<body> eq 'bot who are you?';
        self.shutdown('leaving...') if %statement<body> eq 'bot quit';
    }

    method say(*@args) {
        $.parent.perl5.invoke('Bot::BasicBot', $.parent.ptr, 'say', self, |@args);
    }
}

my $bot = P6Bot.new(
    perl5    => $p5,
    server   => "irc.freenode.org",
    port     => "6667",
    channels => ["#perl6"],
    nick     => "p6basicbot",
    name     => "Yet Another Bot",
);

$bot.run();

# vim: ft=perl6
