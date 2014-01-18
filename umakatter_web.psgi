use strict;
use warnings;

use Umakatter::Web;

my $app = Umakatter::Web->apply_default_middlewares(Umakatter::Web->psgi_app);
$app;

