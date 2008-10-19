#!/usr/bin/env perl
use strict;
use warnings;
use FindBin::libs;

use Perl6::Say;
use Algorithm::DivSufSort;
use Benchmark;
use Path::Class qw/file/;

use Algorithm::MTF;
use Algorithm::MTF::List;
use Algorithm::MTF::Array;

sub bs_encode ($) {
    my $text = shift;
    my $sa = divsufsort( $text );

    my @text = unpack('C*', $text);
    return join '', map { chr $text[$_ -1] } @$sa;
}

my $bwt = bs_encode file('/etc/passwd')->slurp;

my $list = Algorithm::MTF::List->new;
for (my $i = 0xff; $i >= 0; $i--) {
    $list->insert(chr $i);
}
my $list_mtf = Algorithm::MTF::Encoder->new($list);

my $array = Algorithm::MTF::Array->new;
for (my $i = 0; $i < 0; $i++) {
    $array->[$i] = chr $i;
}
my $array_mtf = Algorithm::MTF::Encoder->new($array);

timethese(100, {
    list  => sub {
        $list_mtf->encode($bwt);
    },
    array => sub {
        $array_mtf->encode($bwt);
    },
});
