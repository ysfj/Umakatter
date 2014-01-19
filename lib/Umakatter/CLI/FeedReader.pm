package Umakatter::CLI::FeedReader;
use Moose;
use Carp;
use URI;
use XML::Feed;
use Umakatter::CLI::FeedReader::Tweet;
use strict;
use Net::Twitter;
use utf8;

has 'consumer_key' => (
	is => 'ro',
	isa => 'Str',
	default => 'KttaU2KxGheIw94vp687ZQ'
);

has 'consumer_secret' => (
	is => 'ro',
	isa => 'Str',
	default => 'sgR98Z3l0yaM6ZaILR1LWyjKxK1FSZ8hpFFN83k37s'
);

has 'access_token' => (
	is => 'ro',
	isa => 'Str',
	default => '307151160-R6wWQfHvaMdnKDyrWvP76VeXKgk00manVM6MEk1e'
);

has 'access_token_secret' => (
	is => 'ro',
	isa => 'Str',
	default => 'ar9RfSFhH7TRXXC7PWWsP1lAYM7Xnmj9YXAyuAUMDgJgj'
);

no Moose;

sub entries {
	my $self = shift;
	my $nt = Net::Twitter->new({
		traits => [qw/API::RESTv1_1/],
		ssl => 1,
		consumer_key => $self->consumer_key,
		consumer_secret => $self->consumer_secret,
		access_token => $self->access_token,
		access_token_secret => $self->access_token_secret,
		});
	my $r = $nt->search({q=>'美味い店', lang=>"ja", count=>100});
	return  @{$r->{statuses}};
}

sub tweets {
	my $self = shift;
	my @tweets;
	my @entries = $self->entries;
	for my $entry (@entries) {
		push( @tweets,
		Umakatter::CLI::FeedReader::Tweet->new($entry)
		);
	}
	return \@tweets;
}

1;
