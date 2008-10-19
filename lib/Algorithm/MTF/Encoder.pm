package Algorithm::MTF::Encoder;
use strict;
use warnings;
use base qw/Algorithm::MTF/;

sub encode {
    my ($self, $text) = @_;
    my @code = map { $self->table->mtf($_) } split //, $text;
    return \@code;
}

1;
