package Home::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'Home::DB::Row';

table {
    name 'teacher';
    pk 'id';
    columns qw(id teachername college mailadress gender);
};

1;
