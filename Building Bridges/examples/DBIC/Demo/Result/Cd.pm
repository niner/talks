use utf8;
package DBIC::Demo::Result::Cd;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DBIC::Demo::Result::Cd

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<cds>

=cut

__PACKAGE__->table("cds");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cds_id_seq'

=head2 artist_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cds_id_seq",
  },
  "artist_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "title",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 artist

Type: belongs_to

Related object: L<DBIC::Demo::Result::Artist>

=cut

__PACKAGE__->belongs_to(
  "artist",
  "DBIC::Demo::Result::Artist",
  { id => "artist_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 13:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7kPADFeDHuCnkZ2VDAhaZg

use v6::inline;

method full_title() {
    "{$.artist.name} - {$.title}"
}
