use utf8;
package ReactChat::Schema::Result::Session;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ReactChat::Schema::Result::Session

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<session>

=cut

__PACKAGE__->table("session");

=head1 ACCESSORS

=head2 id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 session_data

  data_type: 'text'
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp with time zone'
  is_nullable: 0

=head2 updated_at

  data_type: 'timestamp with time zone'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "session_data",
  { data_type => "text", is_nullable => 0 },
  "created_at",
  { data_type => "timestamp with time zone", is_nullable => 0 },
  "updated_at",
  { data_type => "timestamp with time zone", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-02-06 13:17:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n6VAHjz1OXVeZhp3Daa9LA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->load_components(qw(InflateColumn::DateTime TimeStamp));
__PACKAGE__->add_column('+created_at' => { set_on_create => 1 });
__PACKAGE__->add_column('+updated_at' => { set_on_create => 1, set_on_update => 1 });

1;
