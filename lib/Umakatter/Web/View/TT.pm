package Umakatter::Web::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    INCLUDE_PATH => [ 
         Umakatter::Web->path_to( 'root', 'src' ),
         Umakatter::Web->path_to( 'root', 'lib' )
    ],  
    PRE_PROCESS  => 'config/main',
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

1;
