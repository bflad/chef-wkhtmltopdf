# chef-wkhtmltopdf [![Build Status](https://secure.travis-ci.org/bflad/chef-wkhtmltopdf.png?branch=master)](http://travis-ci.org/bflad/chef-wkhtmltopdf)

## Description

Installs [wkhtmltopdf](http://wkhtmltopdf.org) static binaries. This cookbook is inspired by https://github.com/firstbanco/chef-wkhtmltopdf.

Cookbook Compatibility:
 * chef-wkhtmltopdf 0.1.0: wkhtmltopdf 0.11.0_rc1
 * chef-wkhtmltopdf 0.2.0: wkhtmltopdf 0.12.0

## Requirements

### Platforms

* CentOS 6
* RedHat 6
* Ubuntu 12.04

### Cookbooks

[Opscode Cookbooks](https://github.com/opscode-cookbooks/)

* [apt](https://github.com/opscode-cookbooks/apt)

## Attributes

These attributes are under the `node['wkhtmltopdf']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
archive | wkhtmltopdf archive name | String | `wkhtmltox-#{node['wkhtmltopdf']['platform']}_#{node['wkhtmltopdf']['version']}-#{node['wkhtmltopdf']['build_sha']}.tar.xz`
build_sha | wkhtmltopdf build SHA | String | 03c001d
dependency_packages | Packages that contain wkhtmltopdf dependencies | String | (auto-detected, see attributes/default.rb)
install_dir | directory to install static binaries | String | /usr/local/bin
lib_dir | directory to install libraries | String | ''
mirror_url | URL for wkhtmltopdf | String | (auto-detected, see attributes/default.rb)
platform | wkhtmltopdf platform and architecture | String | (auto-detected, see attributes/default.rb)
version | wkhtmltopdf version to install | String | 0.12.0

## Recipes

* `recipe[wkhtmltopdf]` Installs wkhtmltoimage and wkhtmltopdf
* `recipe[wkhtmltopdf::binary]` Installs wkhtmltoimage and wkhtmltopdf static binaries

## Usage

* Add recipe(s) to node's run list

## Testing and Development

Here's how you can quickly get testing or developing against the cookbook thanks to [Vagrant](http://vagrantup.com/) and [Berkshelf](http://berkshelf.com/).

    vagrant plugin install vagrant-berkshelf
    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-omnibus
    git clone git://github.com/bflad/chef-wkhtmltopdf.git
    cd chef-wkhtmltopdf
    vagrant up BOX # BOX being centos5, centos6, debian7, fedora18, fedora19, fedora20, freebsd9, ubuntu1204, ubuntu1210, ubuntu1304, or ubuntu1310

You can then SSH into the running VM using the `vagrant ssh BOX` command.

The VM can easily be stopped and deleted with the `vagrant destroy` command. Please see the official [Vagrant documentation](http://docs.vagrantup.com/v2/cli/index.html) for a more in depth explanation of available commands.

## Contributing

Please use standard Github issues/pull requests and if possible, in combination with testing on the Vagrant boxes.

## Maintainers

* Brian Flad (<bflad417@gmail.com>)

## License

Please see licensing information in: [LICENSE](LICENSE)

