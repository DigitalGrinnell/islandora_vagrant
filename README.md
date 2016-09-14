# Islandora Vagrant [![Build Status](https://travis-ci.org/Islandora-Labs/islandora_vagrant.svg?branch=master)](https://travis-ci.org/Islandora-Labs/islandora_vagrant)

## Introduction

The is a development environment virtual machine for Islandora 7.x-1.x. It should work on any operating system that supports VirtualBox and Vagrant.

N.B. This virtual machine **should not** be used in production.

## Customizations (EXTENSIONS)

This is a customized fork of the https://github.com/Islandora-Labs/islandora_vagrant project.  **Note that changes in this project are NOT to be pushed back upstream to https://github.com/Islandora-Labs/islandora_vagrant.** A ./scripts/custom.sh bash script (a feature supported by the original project) has been added along with the addition of a ./scripts/custom directory and a ./configs/custom_variables bash script.  The original project has NOT been modified in any way, it has only been EXTENDED.
 
The project was initially extended by adding an scg.sh (Sample Content Generator) and a theme.sh (allows a Drupal theme to be applied to the VM) script to the ./scripts/custom directory, along with introduction of supporting variables in ./configs/custom_variables. 

Additional extensions to the project can be introduced by adding a bash script (patterned after either scg.sh or theme.sh) to ./scripts/custom along with additional variables, if needed, in ./configs/custom_variables.  Any/all '*.sh' named scripts found in ./scripts/custom will be invoked by custom.sh after the original islandora_libraries.sh and islandora_modules.sh scripts have run, and immediately before the original post.sh script runs.

Additions to the project should be independent and idempotent (producing the same results if run more than once) whenever possible since the order of execution of scripts in ./scripts/custom may be unpredictable.

Extension History -------------------- 

  * scg.sh - Adds and invokes Mark Jordan's Sample Content Generator module. 2016-03-28 MM
  * theme.sh - Adds ability to download, enable and set a default theme from Drupal.org or via Git. 2016-03-28 MM
  * icu.sh - Adds the Islandora Common Utilities (ICU) module from Digital Grinnell. 2016-03-29 MM
  * idu.sh - Adds the Islandora Drush Utilities (IDU) module from Digital Grinnell. Depends on ICU. 2016-03-29 MM

The remainder of this document is identical to README.md from the https://github.com/Islandora-Labs/islandora_vagrant project.

## Requirements

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](http://www.vagrantup.com)
3. [git](https://git-scm.com/)

## Variables

### System Resources

By default the virtual machine that is built uses 3GB of RAM. Your host machine will need to be able to support that. You can override the CPU and RAM allocation by creating `ISLANDORA_VAGRANT_CPUS` and `ISLANDORA_VAGRANT_MEMORY` environment variables and setting the values. For example, on an Ubuntu host you could add to `~/.bashrc`:

```bash
export ISLANDORA_VAGRANT_CPUS=4
export ISLANDORA_VAGRANT_MEMORY=4096
```

### Hostname and Port Forwarding

If you use a DNS or host file management plugin with Vagrant,  you may want to set a specific hostname for the virtual machine and disable port forwarding. You can do that with the `ISLANDORA_VAGRANT_HOSTNAME` and `ISLANDORA_VAGRANT_FORWARD` variables. For example:

```bash
export ISLANDORA_VAGRANT_HOSTNAME="islandora.vagrant.test"
export ISLANDORA_VAGRANT_FORWARD="FALSE"
```

## Use

1. `git clone https://github.com/islandora-labs/islandora_vagrant`
2. `cd islandora_vagrant`
3. `vagrant up`

## Connect

You can connect to the machine via the browser at [http://localhost:8000](http://localhost:8000).

The default Drupal login details are:
  - username: admin
  - password: islandora

MySQL:
  - username: root
  - password: islandora

Tomcat Manager:
  - username: islandora
  - password: islandora

Fedora:
  - username: fedoraAdmin
  - password: fedoraAdmin

GSearch:
  - username: fgsAdmin
  - password: fgsAdmin

ssh, scp, rsync:
  - username: vagrant
  - password: vagrant
  - Examples
    - `ssh -p 2222 vagrant@localhost` or `vagrant ssh`
    - `scp -P 2222 somefile.txt vagrant@localhost:/destination/path`
    - `rsync --rsh='ssh -p2222' -av somedir vagrant@localhost:/tmp`

## Environment

- Ubuntu 14.04
- Drupal 7.43
- MySQL 5.5.47
- Apache 2.4.7
- Tomcat 7.0.55.0
- Solr 4.2.0
- Fedora 3.8.1
- GSearch HEAD
- PHP 5.5.9-1ubuntu4.14
- Java 8 (Oracle)
- FITS 0.10.1
- drush 5.10.0
- jQuery 1.10.2

## Maintainers

* [Nick Ruest](https://github.com/ruebot)
* [Luke Taylor](https://github.com/lutaylor)

## Authors

* [Nick Ruest](https://github.com/ruebot)
* [Jared Whiklo](https://github.com/whikloj)
* [Logan Cox](https://github.com/lo5an)
* [Kevin Clarke](https://github.com/ksclarke)
* [Mark Jordan](https://github.com/mjordan)
* [Mark Cooper](https://github.com/mark-cooper)

## Acknowledgements

This project was inspired by Ryerson University Library's [Islandora Chef](https://github.com/ryersonlibrary/islandora_chef), which was inspired by University of Toronto Libraries' [LibraryChef](https://github.com/utlib/chef-islandora). So, many thanks to [Graham Stewart](https://github.com/whitepine23), and [MJ Suhonos](http://github.com/mjsuhonos/).
