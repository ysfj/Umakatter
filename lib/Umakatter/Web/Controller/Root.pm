package Umakatter::Web::Controller::Root;
use Moose;
use namespace::autoclean;
use Data::Page::Navigation;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    my $page = $c->req->param('page') || 1;
    $c->stash->{tweets} = $c->model('API')->get_recent_tweets($page);

}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

__PACKAGE__->meta->make_immutable;

1;
