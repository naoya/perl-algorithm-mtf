package Algorithm::MTF::List;
use strict;
use warnings;
use base qw/Class::Accessor::Lvalue::Fast/;

use Algorithm::MTF::List::Node;

__PACKAGE__->mk_accessors(qw/first/);

sub new {
    my $class = shift;
    my $self = $class->SUPER::new(@_);

    ## the first element is a sentinel.
    $self->first = Algorithm::MTF::List::Node->new;

    return bless $self, $class;
}

sub insert {
    my ($self, $node) = @_;

    if (not ref $node) {
        $node = Algorithm::MTF::List::Node->new($node);
    }

    $self->first->insert_next($node);
}

sub mtf {
    my ($self, $value) = @_;

    my $node = $self->first;
    my $pos = 0;

    while (defined $node->next) {
        if ($node->next->value eq $value) {
            last;
        }
        $pos++;
        $node = $node->next;
    }

    if ($pos > 0) {
        $self->insert( $node->remove_next );
    }

    return $pos;
}

sub mtf_by_pos {
    my ($self, $pos) = @_;

    my $node = $self->first;
    for (my $i = 0; $i < $pos; $i++) {
        $node = $node->next;
    }

    my $value = $node->next->value;

    if ($pos > 0) {
        $self->insert( $node->remove_next );
    }

    return $value;
}

1;
