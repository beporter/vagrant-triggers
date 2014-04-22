# vagrant-halt-others

[![Build Status](https://travis-ci.org/beporter/vagrant-halt-others.png?branch=master)](https://travis-ci.org/beporter/vagrant-halt-others)

Originally based on [emyl/vagrant-triggers](http://github.com/emyl/vagrant-triggers).

Causes any other (local?) boxes running via vagrant to halt when running `vagrant up`.

## Installation

Ensure you have downloaded and installed Vagrant 1.2+ from the
[Vagrant downloads page](http://downloads.vagrantup.com/).

Installation is performed in the prescribed manner for Vagrant plugins:

    $ vagrant plugin install vagrant-halt-others

## Usage

Run `vagrant up` as normal. The plugin will look for other running boxes and issue a `halt` command for each.

### Skipping Execution

Other running boxes will not be halted if the ```VAGRANT_NO_HALT_OTHERS``` environment variable is set.

## Contributing

To contribute, clone the repository, and use [Bundler](http://bundler.io/)
to install dependencies:

    $ bundle

To run the plugin's tests:

    $ bundle exec rake

You can now fork this repository, make your changes and send a pull request.


