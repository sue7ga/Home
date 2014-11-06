package Home::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use Data::Dumper;

any '/' => sub {
    my ($c) = @_;
    my $counter = $c->session->get('counter') || 0;
    $counter++;
    $c->session->set('counter' => $counter);
    return $c->render('index.tx', {
        counter => $counter,
    });
};

get '/teacher' => sub{
  my ($c) = @_;
  return $c->render('register.tx');
};

get '/list' => sub{
 my ($c) = @_;
 my @teachers = $c->db->teacher_list;
 return $c->render('teacher.tx',{teachers => \@teachers});
};

post 'teacher/register' => sub{
  my ($c) = @_;
  my $req = $c->req->{'amon2.body_parameters'};
  print Dumper $req;
  $c->db->insert_teacher($req);
  return $c->redirect('/teacher');
};

1;
