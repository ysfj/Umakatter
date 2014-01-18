package Umakatter::CLI::Crawler;
use Moose;
use Umakatter::CLI::FeedReader;
use Umakatter::API::DB;
use Umakatter::API::EncodeUtf8;

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
			my $strname = $tweet->author;
			Umakatter::API::EncodeUtf8->encutf8( $strname );
			$user = $schema->resultset('User')->create(
				{
					name => $strname,
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