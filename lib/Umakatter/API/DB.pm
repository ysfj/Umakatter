package Umakatter::API::DB;
use MooseX::Singleton;
use Carp;
use Umakatter::Schema;
use Umakatter::Web;

sub schema {
	my $self = shift;
	my $connect_info = Umakatter::Web->config->{connect_info} or
		Carp::croak('connect_info is required on umakatter_web_conf');
		return Umakatter::Schema->connect( @$connect_info );
}

1;
	