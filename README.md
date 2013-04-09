MuticastStockEngine
===================

=head1 NAME

MulticastStockEngine

=head1 DESCRIPTION

The multicast stock Engine provide yahoo stock information to the local network.
All multicast pakages will encrypted by the server and decpryted by the client!

=head1 VERSION

Version 0.1

=cut

our $VERSION = '0.1';

=head1 SYNOPSIS

You can start the server by running: 

      % perl MulticastStockServer.pl 

or the client by running:

	% perl MulticastStockClient.pl

=head1  STOCK CONDIFUGARION 

Configuration can be changes by modify in Stock.ini. 
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
