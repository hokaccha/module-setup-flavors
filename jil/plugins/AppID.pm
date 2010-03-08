package Jil::AppID;

use strict;
use warnings;

use Digest::SHA1 qw/sha1_hex/;
use base 'Module::Setup::Plugin';

sub register {
    my $self = shift;
    $self->add_trigger( after_setup_template_vars => \&after_setup_template_vars );
}

sub after_setup_template_vars {
    my ($self, $template_vars) = @_;

    $template_vars->{app_id} = sha1_hex( $template_vars->{module} . rand );
}

1;
