package Algorithm::MTF::Decoder;
use strict;
use warnings;
use base qw/Algorithm::MTF/;

use Params::Validate qw/validate_pos ARRAYREF/;

sub decode {
    my ($self, $code) = validate_pos(@_, 1, { type => ARRAYREF });
    my @buf = map { $self->table->mtf_by_pos($_) } @$code;
    return join '', @buf;
}

1;
