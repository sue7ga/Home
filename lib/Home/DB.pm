package Home::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);
use Data::Dumper;

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub teacher_list{
 my ($self) = @_;
 my @teachers = $self->search(
   'teacher',
    {},
    {order_by => {'id' => 'DESC'}}
 );
 return @teachers;
}

sub student_list{
 my ($self) = @_;
 my @students = $self->search(
   'student',
    {},
    {order_by => {'id' => 'DESC'}}
 );
 return @students;
}

sub insert_student{
 my($self,$param) = @_;
 $self->insert('student',{
    name => $param->{name},
    furi => $param->{furi},
    school => $param->{school},
    age => $param->{age},
    mailaddress => $param->{mail},
    sex => $param->{sex}
 });
}

sub insert_teacher{
 my($self,$param) = @_;
 $self->insert('teacher',{ 
   college => $param->{colledge},
   teachername => $param->{name},
   mailadress => $param->{mail},
   gender => $param->{gender}
  });
}

1;
