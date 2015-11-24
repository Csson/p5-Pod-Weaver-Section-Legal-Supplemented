use strict;
use warnings;

package Pod::Weaver::Section::Legal::Supplemented;

# VERSION
# ABSTRACT: Short intro

use Moose;
extends 'Pod::Weaver::Section::Legal';
use Types::Standard qw/ArrayRef Str/;

for my $where (qw/before after/) {
    has "text_$where" => (
        is => 'rw',
        isa => ArrayRef[Str],
        traits => ['Array'],
        predicate => "has_$where",
        init_arg => $where,
        handles => {
            "all_$where"  => 'elements',
            "join_$where" => 'join',
        },
    );
}

around weave_section => sub {
    my $next = shift;
    my $self = shift;
    my $document = shift;
    my $input = shift;

    $self->$next($document, $input);
    my $place = $document->children->[-1];

    if($self->has_before) {
        my $current_text = $place->children->[0];
        unshift @{ $place->children } => Pod::Elemental::Element::Generic::Text->new(content => $self->join_before("\n"));
    }
    if($self->has_after) {
        push @{ $place->children } => Pod::Elemental::Element::Generic::Text->new(content => $self->join_after("\n") . "\n\n");
    }
};


1;

__END__

=pod

=head1 SYNOPSIS

    ; in weaver.ini
    [Legal::Supplemented]
    before = This text is rendered before the auto-generated
    before = from [Legal]
    after = And this text comes after
    after =
    after = More text here

=head1 DESCRIPTION

Pod::Weaver::Section::Legal::Supplemented is a sub-class of L<Pod::Weaver::Section::Legal> that gives the possibility to add text before and/or after the auto-generated
text that C<[Legal]> renders. Sometimes it might be nice/necessary to mention relationships to companies, trademarks, et cetera used or mentioned. This plugin gives the
opportunity to do that without losing the functionality of C<[Legal]> and without having to create another section.

=head1 SEE ALSO

=for :list
* L<Pod::Weaver::Section::LegalWithAddendum> which inspired this

=cut
