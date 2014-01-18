package Umakatter::CLI::FeedReader;
use Moose;
use Carp;
use URI;
use XML::Feed;
use Umakatter::CLI::FeedReader::Tweet;
use strict;
use Net::Twitter;
use utf8;
#binmode STDOUT, ":utf8";
#use Encode qw(decode_utf8);

has 'consumer_key' => (
	is => 'ro',
	isa => 'Str',
	default => 'xxxx'
);

has 'consumer_secret' => (
	is => 'ro',
	isa => 'Str',
	default => 'xxxx'
);

has 'access_token' => (
	is => 'ro',
	isa => 'Str',
	default => 'xxxx'
);

has 'access_token_secret' => (
	is => 'ro',
	isa => 'Str',
	default => 'xxxx'
);

has 'api_url' => (
	is => 'ro',
	isa => 'Str',
	default => "xxxx"
);

no Moose;

sub entries {
	my $self = shift;
	my $nt = Net::Twitter->new({
		traits => [qw/API::RESTv1_1/],
		apiurl => $self->api_url,
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
