package Umakatter::CLI::FeedReader::Tweet;
use Moose;
use URI;
use Date::Calc qw(Decode_Month);
use Encode 'decode';
use Encode::Guess;
use Umakatter::API::EncodeUtf8;
use utf8;

has 'id' => ( is => 'rw', isa => 'Str', );
has 'author' => ( is => 'rw', isa => 'Str', );
has 'content' => ( is => 'rw', isa => 'Str', );
has 'date' => ( is => 'rw', isa => 'DateTime', );
has 'image_url' => ( is => 'rw', isa => 'URI', );

no Moose;

sub BUILDARGS {
	my ( $class, $status ) = @_;
	my ( $id, $author, $date, $image_url );
	
	#created at要素(例：Wed Jan 01 16:54:54 +0000 2014)を空白文字で分割し配列に格納
	my $datestr = $status->{created_at};
	my @datestrlist = split(/ /, $datestr);

	#dateオブジェクトとして作成
	$date = DateTime->new(
    	time_zone => 'Asia/Tokyo',
    	year =>$datestrlist[5] , month => Decode_Month($datestrlist[1]),   day => $datestrlist[2],
    	hour => substr($datestrlist[3],0,2),   minute => substr($datestrlist[3],3,2), second => substr($datestrlist[3],6,2)
	);
	
	$image_url = URI->new($status->{user}->{profile_image_url});
	return {
		id => $status->{id_str},
		author => $status->{user}->{name},
		content => $status->{text},
		date => $date,
		image_url => $image_url,
	};
}

1;