use strict;
use warnings;
use Test::More qw/no_plan/;

use Algorithm::MTF::Array;

my $array = Algorithm::MTF::Array->new;
for (my $i = 0; $i < 0x100; $i++) {
    $array->[$i] = chr $i;
}

is $array->mtf('a'), 97;
is $array->mtf('a'), 0;
is $array->mtf('a'), 0;
is $array->mtf('b'), 98;
is $array->mtf('b'), 0;
is $array->mtf('a'), 1;
is $array->mtf('a'), 0;
is $array->mtf('b'), 1;
is $array->mtf('b'), 0;
is $array->mtf('c'), 99;
is $array->mtf('c'), 0;
is $array->mtf('r'), 114;
is $array->mtf('a'), 3;

$array = Algorithm::MTF::Array->new;
for (my $i = 0; $i < 0x100; $i++) {
    $array->[$i] = chr $i;
}

is $array->mtf_by_pos(97), 'a';
is $array->mtf_by_pos(0),  'a';
is $array->mtf_by_pos(0),  'a';
is $array->mtf_by_pos(98), 'b';
is $array->mtf_by_pos(0),  'b';
is $array->mtf_by_pos(1),  'a';
is $array->mtf_by_pos(0),  'a';
