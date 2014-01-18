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

=head1 NAME

Umakatter::Web::View::TT - TT View for Umakatter::Web

=head1 DESCRIPTION

TT View for Umakatter::Web.

=head1 SEE ALSO

L<Umakatter::Web>

=head1 AUTHOR

System Administrator

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
