#!/usr/bin/env perl

use strict;
use warnings;
use FindBin::libs;

use DateTime;
use [% module %]::Models;

my $datafile = models('home')->subdir(qw/sql fixtures/)->file('default.pl');
do $datafile or die $!;


