use strict;
use warnings;
package Template::Plugin::Haml;
BEGIN {
  $Template::Plugin::Haml::VERSION = '0.1.0';
}

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

__END__
=pod

=head1 NAME

Template::Plugin::Haml

=head1 VERSION

version 0.1.0

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

=head1 AUTHOR

Caleb Cushing <xenoterracide@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Caleb Cushing.

This is free software, licensed under:

  The Artistic License 2.0

=cut

