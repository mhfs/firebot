Campfirer
=========

Campfirer is a bot for Campfire, the chat application from 37Signals, that offers an extensible
interface to programmatically integrate it with other applications/services.

WARNING
-------

CAMPFIRER IS UNDER DEVELOPMENT. NO STABLE RELEASE IS AVAILABLE.

Usage
-----

Campfirer comes with its own executable. `campfirer` in the terminal
gives you its options:

    Tasks:
      campfirer create_config  # Create a sample config file in ~/.campfirer
      campfirer help [TASK]    # Describe available tasks or one specific task
      campfirer start          # Startup the Campfirer daemon
      campfirer stop           # Stop the Campfirer daemon

The steps to get it up and running are:

1. Run `campfirer create_config`
2. Tweak the config file in `~/.campfirer`
3. Run `campfirer start`

Supported Applications/Services
-------------------------------

PingPong: dummy plugin to check the plugins interface.

Meta
----

* Home: <https://github.com/mhfs/campfirer/>

Author
------

Marcelo Silveira :: marcelo@mhfs.com.br :: @mhfsilveira

License
-------

Campfirer is released under the MIT Licence. Copyright &copy; 2011 Marcelo Silveira.
