use Mojolicious::Lite;
 
# /1
# /123
any '/:bar' => [bar => qr/\d+/] => sub {
  my $c   = shift;
  my $bar = $c->param('bar');
  $c->render(text => "Our :bar placeholder matched $bar");
};
 
app->start;
