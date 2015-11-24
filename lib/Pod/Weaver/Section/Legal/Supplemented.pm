use strict;
use warnings;

package Pod::Weaver::Section::Legal::Supplemented;

# VERSION
# ABSTRACT: Add text to the Legal section

use Moose;
extends 'Pod::Weaver::Section::Legal';
with 'Pod::Weaver::Role::AddTextToSection';
use Types::Standard qw/ArrayRef Str/;

sub mvp_multivalue_args { qw/text_before text_after/ }

for my $where (qw/text_before text_after/) {
    has $where => (
        is => 'rw',
        isa => ArrayRef->plus_coercions(Str, sub { [$_] }),
        coerce => 1,
        traits => ['Array'],
        predicate => "has_$where",
        default => sub { [] },
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

    if($self->has_text_before) {
        $self->add_text_to_section($document, $self->join_text_before("\n"), $self->header, { top => 1 });
    }
    if($self->has_text_after) {
        $self->add_text_to_section($document, $self->join_text_after("\n") . "\n\n", $self->header);
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

=head1 ATTRIBUTES

This plugin inherits all attributes from L<Pod::Weaver::Section::Legal>.

=head2 text_before

Optional.

The text that should come before the C<[Legal]> rendered text. Allowed multiple times.

=head2 text_after

Optional.

The text that should come after the C<[Legal]> rendered text. Allowed multiple times.

=head1 SEE ALSO

=for :list
* L<Pod::Weaver::Section::LegalWithAddendum> which inspired this

=cut
