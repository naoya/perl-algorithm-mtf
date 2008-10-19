package Algorithm::MTF;
use strict;
use warnings;
use base qw/Class::Accessor::Lvalue::Fast/;

our $VERSION = '0.01';

__PACKAGE__->mk_accessors(qw/table/);

use UNIVERSAL::require;
use Algorithm::MTF::Encoder;
use Algorithm::MTF::Decoder;

sub new {
    my ($class, $backend) = @_;
    my $self = $class->SUPER::new;

    if (not defined $backend) {
        Algorithm::MTF::List->require or die $@;
        my $list = Algorithm::MTF::List->new;
        for (my $i = 0xff; $i >= 0; $i--) {
            $list->insert(chr $i);
        }
        $self->table = $list;

#         Algorithm::MTF::Array->require or die $@;
#         my $array = Algorithm::MTF::Array->new;
#         for (my $i = 0; $i < 0x100; $i++) {
#             $array->[$i] = chr $i;
#         }
#        $self->table = $array;
    } else {
        $self->table = $backend;
    }

    bless $self, $class;
}

1;

__END__

=head1 NAME

Algorithm::MTF - Move-to-front transform encoder/decoder

=head1 SYNOPSIS

  use Algorithm::MTF;

  my $encoder = Algorithm::MTF::Encoder->new;
  my $code = $mtf->encode("aaabac"); ## $code is [ 97, 0, 0, 98, 1, 99 ]

  my $decoder = Algorithm::MTF::Decoder->new;
  say $mtf->decode([ 97, 0, 0, 98, 1, 99 ]); # "aaabac"

=head1 DESCRIPTION

The move-to-front (or MTF) transform is an encoding of data (typically
a stream of bytes) designed to improve the performance of entropy
encoding techniques of compression. When efficiently implemented, it
is fast enough that its benefits usually justify including it as an
extra step in data compression algorithms. (quote from en.wikipedia.org)

=head1 SEE ALSO

L<http://en.wikipedia.org/wiki/Move-to-front_transform>

=head1 AUTHOR

Naoya Ito, E<lt>naoya at bloghackers.net<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Naoya Ito

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut
