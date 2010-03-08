#!/usr/bin/env perl

use strict;
use warnings;

use Perl6::Say;
use MIME::Lite;
use Archive::Zip;
use Getopt::Long;
use Pod::Usage;

my $no_archive;
my $no_mail;
GetOptions (
    'no_archive' => \$no_archive,
    'no_mail'    => \$no_mail,
    'help'       => \my $help,
);
pod2usage() if $help;

my %conf = (
    src_dir       => 'src',
    wgt_file_name => 'wgt/[% module %].wgt',
    mail_from     => '[% config.mail_from %]',
    mail_to       => '[% config.mail_to %]',
);

unless ($no_archive) {
    my $zip = Archive::Zip->new;
    $zip->addTree( $conf{src_dir} );
    $zip->writeToFileNamed( $conf{wgt_file_name} );

    say "created zip archive: $conf{wgt_file_name}";
}

unless ($no_mail) {
    my $msg = MIME::Lite->new(
        From     => $conf{mail_from},
        To       => $conf{mail_to},
        Subject  => '[% module %] Widget',
        Type => 'multipart/mixed',
    );
    $msg->attach(
        Type => 'text/plain; charset="iso-2022-jp"',
        Data => 'Attache Widget'
    );
    $msg->attach(
        Type     => 'application/octet-strea',
        Encoding => 'base64',
        Path     => $conf{wgt_file_name},
    );
    $msg->send;

    say "send mail to: $conf{mail_to}";
}

__END__

=head1 SYNOPSIS

    $ bin/jil.pl [--no_archive] [--no_mail]

