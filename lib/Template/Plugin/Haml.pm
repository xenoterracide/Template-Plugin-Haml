use strict;
use warnings;
package Template::Plugin::Haml;

use parent 'Template::Plugin::Filter';
use Text::Haml;

sub init {
	my $self = shift;
	$self->{_DYNAMIC} = 1;
	$self->install_filter( $self->{_ARGS}->[0] || 'haml');
	$self;
}

sub filter {
	my ( $self, $text ) = @_;

	my $haml = Text::Haml->new;
	return $haml->render($text);
}
1;
# ABSTACT: HAML plugin for Template Toolkit
=head1 SYNOPSIS

	[%- USE Haml -%]
	[%- FILTER haml -%]
	%p Hello World
	[%- END -%]

=head1 DESCRIPTION
=head2 Methods

=over

=item init

initializes the the filter object

=item filter

method that acutally does the transformation

=back

=head1 ACKNOWLEDGEMENTS

Thanks to kd, mst, Khisanth, aef on irc://irc.perl.org/tt for helping me
figure out why my first try didn't work

=head1 BUGS

=over

=item HAML variables don't work

use TT style variables instead

=back

=cut
