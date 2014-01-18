use utf8;
package Umakatter::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Umakatter::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::UTF8Columns>

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("UTF8Columns", "InflateColumn::DateTime");

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 191

=head2 image_url

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 updated_on

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "name",
  { data_type => "varchar", is_nullable => 0, size => 191 },
  "image_url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "updated_on",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->set_primary_key("name");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-15 06:34:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:i56IYZsSvj/3kjj68OgSzw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
