#
# This file is part of Riak-Light
#
# This software is copyright (c) 2013 by Weborama.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
## no critic (RequireUseStrict, RequireUseWarnings)
package Riak::Light::Util;
{
    $Riak::Light::Util::VERSION = '0.058';
}
## use critic
use Config;
use Exporter 'import';

@EXPORT_OK = qw(is_windows is_netbsd_6_32bits is_solaris);

sub is_windows {
    $Config{osname} eq 'MSWin32';
}

sub is_netbsd_6_32bits {
    _is_netbsd();
}

sub _is_netbsd {
    $Config{osname} eq 'netbsd';
}

sub is_solaris {
    $Config{osname} eq 'solaris';
}

1;


__END__

=pod

=head1 NAME

Riak::Light::Util

=head1 VERSION

version 0.058

=head1 DESCRIPTION

  Internal class

=head1 AUTHORS

=over 4

=item *

Tiago Peczenyj <tiago.peczenyj@gmail.com>

=item *

Damien Krotkine <dams@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Weborama.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
