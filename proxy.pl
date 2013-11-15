#!perl
#
# This file is part of Riak-Light
#
# This software is copyright (c) 2013 by Weborama.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
use strict;
use warnings;
use Net::Proxy;
use feature 'say';
use List::MoreUtils qw( natatime );

my $in_hook = sub {
    my $msg = shift;
    my $it = natatime 20, map { sprintf "%02x", ord $_ } split "", $$msg;
    while ( my @v = $it->() ) {
        say ">>>> ", join ",", @v;
    }
};

my $out_hook = sub {

    my $msg = shift;

    my @pontos = '.' x int( length($$msg) / 20 );
    my $it = natatime 20, @pontos;

    while ( my @v = $it->() ) {
        say "<<<< ", join "", @v;
    }
};

Net::Proxy->new(
    {   in => {
            type => 'tcp', host => 'localhost', port => 8087, hook => $in_hook,
        },
        out => {
            type => 'tcp', host => 'riak-preprod.vip.in.weborama.fr',
            port => 8087,  hook => $out_hook,
        },
    }
)->register();

Net::Proxy->mainloop();
