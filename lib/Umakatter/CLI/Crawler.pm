package Umakatter::CLI::Crawler;
use Moose;
use Umakatter::CLI::FeedReader;
use Umakatter::API::DB;

has 'feed_reader' => (	is => 'rw', isa => 'Umakatter::CLI::FeedReader', required => 1 );

no Moose;

sub run {
	my $self = shift;
	my $tweets = $self->feed_reader->tweets();
	my $schema = Umakatter::API::DB->schema;
	for my $tweet (@$tweets){
		
		#insert User
		my $user;
		if( $user = $schema->resultset('User')->find({ name => $tweet->author } ) )
		{
			$user->image_url( $tweet->image_url );
			$user->updated_on( $tweet->date );
			$user->update();
		}else{
			$user = $schema->resultset('User')->create(
				{
					name => $tweet->author;,
					image_url => $tweet->image_url,
					updated_on => $tweet->date,
				}
			);
		}
		
		#insert Tweet
		my $tweet_inserted = $schema->resultset('Tweet')->find_or_create(
			{
				id => $tweet->id,
				body => $tweet->content,
				user_name => $user->name,
				created_on => $tweet->date,
			}
		);
		warn $tweet_inserted->id . "is found or createed!\n";
	}
}

1;
