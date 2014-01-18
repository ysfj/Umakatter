use strict;
use Test::More ('no_plan');
use warnings;

use lib '/Users/yuu/Documents/perl/catalyst/Umakatter-Web/lib';
#require Data::Dumper;
#print Data::Dumper->Dump([\@INC], ['*INC']) . "\n";

use_ok('Umakatter::CLI::FeedReader');

my $feed_reader = Umakatter::CLI::FeedReader->new();
my $tweets = $feed_reader->tweets();
my $teststr;
is( ref $tweets, 'ARRAY', 'Feed::CLI::FeedReader::tweets return ARRAY Ref' );
isa_ok( $tweets->[0], 'Umakatter::CLI::FeedReader::Tweet');
ok( $tweets->[0]->id, 'Umakatter::CLI::FeedReader::Tweet::id');
#$teststr = $tweets->[0]->id;
#print "\n";
#print "$teststr\n";
ok( $tweets->[0]->author, 'Umakatter::CLI::FeedReader::Tweet::author');
#$teststr = $tweets->[0]->author;
#print "\n";
#print "$teststr\n";
ok( $tweets->[0]->content, 'Umakatter::CLI::FeedReader::Tweet::content');
#$teststr = $tweets->[0]->content; 
#print "\n";
#print "$teststr\n";
isa_ok( $tweets->[0]->date, 'DateTime' );
#$teststr = $tweets->[0]->date;
#print "\n";
#print "$teststr\n";
isa_ok( $tweets->[0]->image_url, 'URI' );
#$teststr = $tweets->[0]->image_url;
#print "\n";
#print "$teststr\n";
