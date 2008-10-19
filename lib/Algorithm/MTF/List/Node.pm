package Algorithm::MTF::List::Node;
use strict;
use warnings;

sub new {
    my ($class, $value) = @_;
    my $self = bless [], ref $class || $class;

    if (defined $value) {
        $self->value = $value;
    }

    return $self;
}

sub value : lvalue {
    shift->[0];
}

sub next : lvalue {
    shift->[1];
}

sub insert_next {
    my ($self, $node) = @_;
    $node->next = $self->next;
    $self->next = $node;
    $node;
}

sub remove_next {
    my $self = shift;
    my $next    = $self->next;
    $self->next = $next->next;
    return $next;
}

1;
