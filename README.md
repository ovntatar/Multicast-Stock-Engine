MuticastStockEngine
===================


The multicast stock Engine provide yahoo stock information to the local network.
All multicast pakages will encrypted by the server and decpryted by the client!

VERSION

Version 0.1

SYNOPSIS

You can start the server by running: 

      % perl MulticastStockServer.pl 

to use client run:

	% perl MulticastStockClient.pl

STOCK CONFIGURATION 

Stock configuration can be change in the Stock.ini file. 
For more information about the yahoo tag check FinanceTag.definition file. 

SUPPORT

You can find documentation for this module with the perldoc command.

	% perldoc MulticastStockServer

You can also look for information at:

GitHub request tracker (report bugs here)

	https://github.com/ovntatar/MuticastStockEngine/issues

LICENSE AND COPYRIGHT

Copyright 2013 Ovidiu Nita Tatar.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
