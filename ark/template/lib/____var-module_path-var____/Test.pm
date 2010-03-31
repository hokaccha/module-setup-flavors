package [% module %]::Test;
use Ark 'Test';

use File::Temp qw/tempdir/;
use [% module %]::Models;

sub import {
    my ($class, $app, %options) = @_;
    $app ||= '[% module %]';

    {
        my $dir = tempdir( CLEANUP => 1 );

        models('conf')->{database} = [
            "dbi:SQLite:$dir/test-database.db", undef, undef,
            { unicode => 1, ignore_version => 1 },
        ];
        models('Schema')->deploy;
    }

    # mysql
    #models('conf')->{database} = models('conf')->{database_test};

    #my $schema = models('Schema');
    #for my $table ($schema->sources) {
    #    local $schema->source($table)->{resultset_attributes} = {};
    #    $schema->resultset($table)->delete;
    #}

    @_ = ($class, $app, %options);
    goto $class->can('SUPER::import');
}

1;
