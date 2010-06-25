use lib 'lib';

# prereqs
use DBIx::Class;
use DBD::mysql;
use DateTime;
use DateTime::Format::MySQL;

use [% module %];
use [% module %]::Models;

# preload models
my $models = [% module %]::Models->instance;
for my $r (keys %{ $models->registered_classes } ) {
    models->get($r);
}


my $app = [% module %]->new;
$app->setup;
