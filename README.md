Firebot
=========

Firebot is a bot for Campfire, the chat application from 37Signals, that offers an extensible
interface to programmatically integrate it with other applications/services.

WARNING
-------

FIREBOT IS UNDER DEVELOPMENT. NO STABLE RELEASE IS AVAILABLE.

Usage
-----

Firebot comes with its own executable. `firebot` in the terminal
gives you its options:

    Tasks:
      firebot create_config  # Create a sample config file in ~/.firebot
      firebot help [TASK]    # Describe available tasks or one specific task
      firebot start          # Startup the Firebot daemon
      firebot stop           # Stop the Firebot daemon

The steps to get it up and running are:

1. Run `firebot create_config`
2. Tweak the config file in `~/.firebot`
3. Run `firebot start`

Supported Applications/Services
-------------------------------

PingPong: dummy plugin to check the plugins interface.

Meta
----

* Home: <https://github.com/mhfs/firebot/>

Author
------

Marcelo Silveira :: marcelo@mhfs.com.br :: @mhfsilveira

License
-------

Firebot is released under the MIT Licence. Copyright &copy; 2011 Marcelo Silveira.
