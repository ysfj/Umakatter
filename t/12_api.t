use strict;
use Test::More ( 'no_plan' );

use_ok ( 'Umakatter::API' );
my $api = Umakatter::API->new;

my $tweets = $api->get_recent_tweets();
isa_ok($tweets, 'DBIx::Class::ResultSet');
my $tweet = $tweets->next;
isa_ok($tweet, 'Umakatter::Schema::Result::Tweet');
ok($tweet->id, 'Umakatter::Schema::Tweet::id');
ok($tweet->body, 'Umakatter::Schema::Tweet::body');
ok($tweet->user_name, 'Umakatter::Schema::Tweet::user_name');
isa_ok($tweet->created_on,'DateTime');
