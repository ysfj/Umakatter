package Umakatter::API;
use Moose;
use Umakatter::APi::DB;

no Moose;

sub get_recent_tweets{
	my ( $self, $page ) = @_;
	$page ||= 1;
	my $schema = Umakatter::API::DB->schema;
	return $schema->resultset('Tweet')->search(
		{},
		{
			rows => 20,
			page => $page,
			order_by => 'created_on DESC',
		}
	
	);
}

1;