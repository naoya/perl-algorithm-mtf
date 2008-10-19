package Algorithm::MTF::Array;
use strict;
use warnings;

sub new {
    my $class = shift;
    bless [] ,$class;
}

sub mtf {
    my ($self, $value) = @_;
    my $i = $self->index_of( $value );
    if ($i > 0) {
        $self->delete_at($i);
        unshift @$self, $value;
    }
    return $i;
}

sub mtf_by_pos {
    my ($self, $pos) = @_;
    my $c = $self->[$pos];
    if ($pos > 0) {
        $self->delete_at($pos);
        unshift @$self, $c;
    }
    return $c;
}

sub delete_at {
    my ($self, $i) = @_;
    if ($i > @$self - 1) {
        return;
    }

    my @end = splice @$self, $i;
    my $value = shift @end;
    push @$self, @end;

    return $value;
}

sub index_of {
    my ($self, $c) = @_;
    for (my $i = 0; $i < @$self; $i++) {
        if ($self->[$i] eq $c) {
            return $i;
        }
    }
}

1;
