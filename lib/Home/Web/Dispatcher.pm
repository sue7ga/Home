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

get '/register' => sub{
  my ($c) = @_;
  return $c->render('register.tx');
};

get '/list' => sub{
 my ($c) = @_;
 my @teachers = $c->db->teacher_list;
 return $c->render('teacher.tx',{teachers => \@teachers});
};

get '/student' => sub{
 my ($c) = @_;
 my @students = $c->db->student_list;
 return $c->render('student.tx',{students => \@students});
};

get '/studentregister' => sub{
 my ($c) = @_;
 return $c->render('studentregister.tx');
};

post 'student/register' => sub{
  my ($c) = @_;
  my $req = $c->req->{'amon2.body_parameters'};
  $c->db->insert_student($req);
  return $c->redirect('/student');
};

post 'teacher/register' => sub{
  my ($c) = @_;
  my $req = $c->req->{'amon2.body_parameters'};
  $c->db->insert_teacher($req);
  return $c->redirect('/teacher');
};

1;
