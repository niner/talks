use v6.c;

unit class Dancr;

use Bailador;
use DBIish;

my %settings;
sub set($name, $value) {
    %settings{$name} = $value
} 
multi sub setting(Str $name) {
    %settings{$name}
}
multi sub setting(Pair $pair) {
    %settings{$pair.key} = $pair.value
}
 
setting 'database'     => $*TMPDIR.child('dancr.db');
setting 'session'      => 'Simple';
setting 'template'     => 'template_toolkit';
setting 'logger'       => 'console';
setting 'log'          => 'debug';
setting 'show_errors'  => 1;
setting 'startup_info' => 1;
setting 'warnings'     => 1;
# webscale authentication method
setting 'username'     => 'admin';
setting 'password'     => 'password';
setting 'layout'       => 'main';
 
my $flash;

method to-app() {
    app.get-psgi-app
}

method start() {
    baile();
}
 
sub set_flash($message) {
    $flash = $message;
}
 
sub get_flash() {
 
    my $msg = $flash;
    $flash = "";
 
    return $msg;
}
 
sub connect_db() {
    my $dbh = DBIish.connect('SQLite', :database(setting('database').Str));
 
    return $dbh;
}
 
sub init_db() {
    my $db = connect_db();
    my $schema = slurp 'schema.sql';
    $db.do($schema) or die $db.errstr;
}
 
sub std_tokens () {
    return 
}

sub layout($content) {
    template 'layouts/' ~ setting('layout') ~ '.tt', {
        css_url    => '/css/style.css',
        login_url  => uri_for('/login'),
        logout_url => uri_for('/logout'),
        session    => session,
        content    => $content,
    };
}
 
get '/' => {
    my $db = connect_db();
    my $sql = 'select id, title, text from entries order by id desc';
    my $sth = $db.prepare($sql);
    $sth.execute;
    layout template 'show_entries.tt', {
        msg           => get_flash(),
        add_entry_url => uri_for('/add'),
        entries       => $sth.allrows(:array-of-hash).map({$_<id> => $_}).hash,
        session       => session,
    };
}
 
post '/add' => {
    unless session<logged_in> {
        send_error("Not logged in", 401);
    }
 
    my $db = connect_db();
    my $sql = 'insert into entries (title, text) values (?, ?)';
    my $sth = $db.prepare($sql) or die $db.errstr;
    $sth.execute(request.params<title>, request.params<text>)
        or die $sth.errstr;
 
    set_flash('New entry posted!');
    redirect '/';
}

get '/login' => sub (*@a) {
    # display login form
    layout template 'login.tt', {err => ''};
 
}
 
post '/login' => sub (*@a) {
    my $err;
 
    # process form input
    if request.params<username> ne setting('username') {
        $err = "Invalid username";
    }
    elsif request.params<password> ne setting('password') {
        $err = "Invalid password";
    }
    else {
        session<logged_in> = True;
        set_flash('You are logged in.');
        return redirect '/';
    }
 
    # display login form
    layout template 'login.tt', {err => $err};
}
 
get '/logout' => {
   app.destroy_session;
   set_flash('You are logged out.');
   redirect '/';
}
 
init_db();

sub send_error($message, $code) {
}

sub uri_for($path) {
    return $path;
}

# vim: ft=perl6
