package [% module %]::Schema::Result::Sample;
use strict;
use warnings;
use base '[% module %]::Schema::ResultBase';

use [% module %]::Models;
use DateTime;

__PACKAGE__->table('sample');

__PACKAGE__->add_columns(
    id => {
        data_type         => 'INTEGER',
        is_nullable       => 0,
        is_auto_increment => 1,
        extra => {
            unsigned => 1,
        },
    },
    title => {
        data_type   => 'VARCHAR',
        size        => 255,
        is_nullable => 0,
    },
    body => {
        data_type   => 'TEXT',
        is_nullable => 0,
    },
    is_delete => {
        data_type     => 'TINYINT',
        is_nullable   => 0,
        default_value => 0,
    },
    created_at => {
        data_type   => 'DATETIME',
        is_nullable => 0,
        timezone    => 'Asia/Tokyo',
    },
    updated_at => {
        data_type   => 'DATETIME',
        is_nullable => 0,
        timezone    => 'Asia/Tokyo',
    },
);

__PACKAGE__->set_primary_key('id');

sub insert {
    my $self = shift;

    $self->entry_date( DateTime->now ) unless $self->entry_date;

    $self->next::method(@_);
}
1;
