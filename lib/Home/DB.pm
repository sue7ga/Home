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

sub insert_teacher{
 my($self,$param) = @_;
 print Dumper $param;
 $self->insert('teacher',{ 
   college => $param->{colledge},
   teachername => $param->{name},
   mailadress => $param->{mail},
   gender => $param->{gender}
  });
}

1;
