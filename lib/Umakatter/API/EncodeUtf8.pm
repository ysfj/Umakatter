package Umakatter::API::EncodeUtf8;
use Carp;
use Encode;
use Encode 'decode';
use Encode 'encode';
use Encode::Guess;
use utf8;

sub decutf8 {
	my ($class, $decstr) = @_;
	print ("Get Argument!" . "$decstr\n", length($decstr) . "\n");
	Encode::_utf8_off($decstr);
	print("Utf8flag off!text " . "$decstr\n", length($decstr) . "\n");
	my $guessdec = Encode::Guess::guess_encoding($decstr);
	if (ref $guessdec && $guessdec->name ne 'utf-8') {
		Encode::from_to($decstr, $guessdec->name, 'utf8');
		print ("decode executed!" . "$decstr\n", length($decstr) . "\n");
		Encode::_utf8_on($decstr);
		print("Utf8flag on!text " . "$decstr\n", length($decstr) . "\n");
	}
	return $decstr;
}



sub encutf8 {
	my $encstr = Encode::_utf8_on(shift);
	my $guessenc = Encode::Guess::guess_encoding($encstr);
	if (ref $guessenc && $guessenc->name ne 'utf-8') {
    	encode('utf-8', $encstr);
	}
	else
	{
		Carp::croak('encutf8 is missed on EncodeUtf8.pm!');
	}
	return $encstr;
}

1;