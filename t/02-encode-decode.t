use strict;
use warnings;
use Test::More qw/no_plan/;

use Algorithm::MTF;

my $mtf = Algorithm::MTF::Encoder->new;

is_deeply $mtf->encode("aaa"), [ 97, 0, 0 ];
is_deeply $mtf->encode("aaa"), [ 0, 0, 0 ];
is_deeply $mtf->encode("bac"), [ 98, 1, 99 ];

$mtf = Algorithm::MTF::Decoder->new;
is $mtf->decode([97, 0, 0, 98, 1, 99]), "aaabac";
