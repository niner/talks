#!perl5

use Bot::BasicBot:from<Perl5>;

class P6Bot is Bot::BasicBot {
    method said(%statement) {
        self.reply($%statement, "Hullo {%statement<who>}!")
            if %statement<body> eq 'Hi bot!';
        self.reply($%statement, "I'm the first Perl 6 bot based on Bot::BasicBot!")
            if %statement<body> eq 'bot who are you?';
        self.shutdown('leaving...')
            if %statement<body> eq 'bot quit';
    }
}

my $bot = P6Bot.new(
    server   => "irc.freenode.org",
    port     => "6667",
    channels => ["#perl6bot"],
    nick     => "p6basicbot",
    name     => "Yet Another Bot",
);

$bot.run();

# vim: ft=perl6
