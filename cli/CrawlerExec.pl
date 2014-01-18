#! /usr/bin/perl
use strict;
use warnings;
use FindBin;
use lib ( "$FindBin::Bin/../lib" );
use Umakatter::CLI::FeedReader;
use Umakatter::CLI::Crawler;

my $feed_reader = Umakatter::CLI::FeedReader->new();
my $crawler = Umakatter::CLI::Crawler->new( feed_reader => $feed_reader );
$crawler->run();
