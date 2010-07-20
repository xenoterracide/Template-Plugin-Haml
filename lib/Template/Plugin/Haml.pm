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
	my ( $self, $text, $args, $config ) = @_;

	my $haml = Text::Haml->new;
	return $haml->render($text);
}
1;
