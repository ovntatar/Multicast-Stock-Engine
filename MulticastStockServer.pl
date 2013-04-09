#!/usr/bin/perl

use warnings;
use strict;

use IO::Socket;
use IO::Socket::Multicast;
use LWP::Simple;
use Crypt::Tea;
use Config::Tiny;

my $port = shift || 5995;
my $addr = shift || '224.0.0.1';
my $ttl  = shift || 10;


my $sock = IO::Socket::Multicast->new() or die "Can't create socket: $!";
$sock->mcast_ttl($ttl) or die "Can't set ttl: $!";
my $dest = sockaddr_in($port,inet_aton($addr));

while (1) {

    my $cfg=Config::Tiny->read("Stock.ini");
    my $fin = $cfg-> {finance_tag}-> {fin};
    my $synbol = $cfg-> {synbol}-> {synbol};

    my $url="http://download.finance.yahoo.com/d/quotes.csv?s=$synbol&f=$fin";
    my $message = LWP::Simple::get($url);

    my $ciphertext = encrypt($message,"sdcfseghb");;
    send ($sock,$ciphertext,0,$dest) || die "couldn't send: $!";
}

__END__

=head1 NAME

MulticastStockServer

=head1 DESCRIPTION

The multicast stock server provide yahoo stock information to the local network.
All multicast pakages will encrypted.

=head1 VERSION

Version 0.1

=cut

our $VERSION = '0.1';

=head1 SYNOPSIS

You can start the server by running: 

    	% perl MulticastStockServer.pl 

=head1 OPTIONAL PARAMENTER 

	% perl MulticastStockServer.pl <PORT> <IP-ADDRESS> <TTL>


=head1  STOCK CONFIGURATION

Stock configuration can be change in the Stock.ini file. 
For more information about the yahoo tag check FinanceTag.definition file.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

	% perldoc MulticastStockServer

You can also look for information at:

=over 4

=item GitHub request tracker (report bugs here)

	https://github.com/ovntatar/MuticastStockEngine/issues

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ovidiu Nita Tatar.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
