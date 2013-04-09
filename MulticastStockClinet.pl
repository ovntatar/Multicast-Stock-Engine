#!/usr/bin/perl
=head1 NAME

MulticastStockClient

=head1 DESCRIPTION

The multicast stock client receive infomration from the MulticastStockServer.
All multicast pakages and encrypted end will be decrypted by the client.

=head1 VERSION

Version 0.1

=cut

our $VERSION = '0.1';

=head1 SYNOPSIS

You can start the server by running: 

    	% perl MulticastStockClient.pl 

=head1 OPTIONAL PARAMENTER 

	% perl MulticastStockClient.pl <PORT> <IP-ADDRESS> 


=head1  STOCK CONDIFUGARION 

Configuration can be changes by modify in Stock.ini. 
For more information about the yahoo tag check FinanceTag.definition file. 


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

	% perldoc MulticastStockClient

You can also look for information at:

=over 4

=item GitHub request tracker (report bugs here)

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ovidiu Nita Tatar.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut




use warnings;
use strict;

use IO::Socket;
use IO::Socket::Multicast;
use Crypt::Tea;

my $port = shift || 5995;
my $addr = shift || '224.0.0.1';

my $sock = IO::Socket::Multicast->new(LocalPort=>$port) or die "Can't create socket: $!";


$sock->mcast_add($addr) or die "multicast_add: $!";
while (1) {
  my ($response,$peer);
  die "receive error: $!" unless $peer = recv($sock,$response,1024,0);
  my ($port,$peeraddr) = sockaddr_in($peer);
	my $plaintext = decrypt($response,"sdcfseghb");;
	print "$plaintext" . "\n";
}
