package Umakatter::Web::Model::API;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'Umakatter::API',
    constructor => 'new',
);

1;
