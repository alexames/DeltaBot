# Reddit Development Environment

Because using mocks to unit test DeltaBot is extremely difficult (because then we would need to mock all of the reddit api) we decided it was easier to just use [vagrant](http://www.vagrantup.com/) and [puppet](https://puppetlabs.com/) to install the [open source version of reddit](https://github.com/reddit/reddit) on a virtual machine.

By using the reddit development environment described here you will have a local installation of reddit which you can run the bot against to test during both development and testing.

## Getting started

- Install vagrant and it's dependencies on your machine first.

- In this directory run
    vagrant up

- Wait while reddit is installed on a VM on your computer. (this will take awhile, it took 10 minutes for me)

- Point your web browser to [http://127.0.0.1:8080/](http://127.0.0.1:8080/).

- copy praw.ini to your configuration directory ([More info](https://github.com/praw-dev/praw/blob/master/docs/pages/configuration_files.rst)).

    * **WINDOWS XP**: C:\\Documents and Settings\\foobar\\ApplicationData\\
    * **WINDOWS Vista/7**: C:\\Users\\foobar\\AppData\\Roaming\\
    * **OS with XDG_CONFIG_HOME defined**: $XDG_CONFIG_HOME/
    * **OS X** / **Linux**: /home/foobar/.config/

## State management

When you first load reddit it will be clean and fresh new install.  However during unit testing it is important that the reddit installation is in a certain expected _state_.  The __pg_dump__ tool is used to create database snapshots which can be saved and loaded with the shell scripts _savestate.sh_ and _loadstate.sh_ respectively.  To use the scripts remote into the VM with _vagrant ssh_, navigate to the _/vagrant_ folder and run the scripts.  Below are some example uses

    ./savestate.sh <state_name>
    ./loadstate.sh <state_name>

    ./loadstate.sh testing       # load 'testing' state

    # make some changes

    ./savestate.sh mikes_state   # save 'mikes_state' state

    ./loadstate.sh testing       # go back to the original 'testing' state
