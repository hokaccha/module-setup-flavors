package [% module %]::Models;
use strict;
use warnings;
use Ark::Models '-base';

register Schema => sub {
    my $self = shift;

    my $conf = $self->get('conf')->{database}
        or die 'require database config';

    $self->ensure_class_loaded('[% module %]::Schema');
    [% module %]::Schema->connect(@$conf);
};

for my $table (qw/Sample/) {
    register "Schema::$table" => sub {
        my $self = shift;
        $self->get('Schema')->resultset($table);
    };
}

1;
