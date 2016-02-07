use utf8;
package ReactChat::Schema::Result::Message;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ReactChat::Schema::Result::Message

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<message>

=cut

__PACKAGE__->table("message");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'message_id_seq'

=head2 nickname

  data_type: 'text'
  is_nullable: 1

=head2 message

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "message_id_seq",
  },
  "nickname",
  { data_type => "text", is_nullable => 1 },
  "message",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-02-06 23:49:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tq07qAkB4QaV1PetYCTmoA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
