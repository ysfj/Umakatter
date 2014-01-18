use utf8;
package Umakatter::Schema::Result::Tweet;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Umakatter::Schema::Result::Tweet

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

=head1 TABLE: C<tweet>

=cut

__PACKAGE__->table("tweet");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 body

  data_type: 'text'
  is_nullable: 0

=head2 user_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 created_on

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
  "body",
  { data_type => "text", is_nullable => 0 },
  "user_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "created_on",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-11 13:12:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:y2LcwBzPg7trXe8qcOunmw

__PACKAGE__->belongs_to(
  'user' => 'Umakatter::Schema::Result::User',
  { "foreign.name" => "self.user_name" }
);

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
