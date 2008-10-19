use strict;
use warnings;
use Test::More qw/no_plan/;

use Algorithm::MTF::List;

my $list = Algorithm::MTF::List->new;

for (my $i = 0xff; $i >= 0; $i--) {
    $list->insert(chr $i);
}

is $list->mtf('a'), 97;
is $list->mtf('a'), 0;
is $list->mtf('a'), 0;
is $list->mtf('b'), 98;
is $list->mtf('b'), 0;
is $list->mtf('a'), 1;
is $list->mtf('a'), 0;
is $list->mtf('b'), 1;
is $list->mtf('b'), 0;
is $list->mtf('c'), 99;
is $list->mtf('c'), 0;
is $list->mtf('r'), 114;
is $list->mtf('a'), 3;

$list = Algorithm::MTF::List->new;
for (my $i = 0xff; $i >= 0; $i--) {
    $list->insert(chr $i);
}

is $list->mtf_by_pos(97), 'a';
is $list->mtf_by_pos(0),  'a';
is $list->mtf_by_pos(0),  'a';
is $list->mtf_by_pos(98), 'b';
is $list->mtf_by_pos(0),  'b';
is $list->mtf_by_pos(1),  'a';
is $list->mtf_by_pos(0),  'a';
