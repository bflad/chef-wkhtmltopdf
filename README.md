# chef-wkhtmltopdf [![Build Status](https://secure.travis-ci.org/bflad/chef-wkhtmltopdf.png?branch=master)](http://travis-ci.org/bflad/chef-wkhtmltopdf)

## Description

Installs [wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) static binaries. This cookbook is inspired by https://github.com/firstbanco/chef-wkhtmltopdf.

## Requirements

### Platforms

* CentOS 6
* RedHat 6
* Ubuntu 12.04

## Attributes

These attributes are under the `node['wkhtmltopdf']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
arch | wkhtmltopdf architecture | String | (auto-detected, see attributes/default.rb)
install_dir | directory to install static binaries | String | /usr/local/bin
mirror_url | Base URL for wkhtmltopdf files | String | http://wkhtmltopdf.googlecode.com/files
version | wkhtmltopdf version to install | String | 0.11.0_rc1

### wkhtmltoimage Attributes

These attributes are under the `node['wkhtmltopdf']['wkhtmltoimage']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
binary_extracted_name | Extracted name of static binary | String | `wkhtmltoimage-#{node['wkhtmltopdf']['arch']}`
binary_full_name | Full name of static binary | String | `wkhtmltoimage-#{node['wkhtmltopdf']['version']}-static-#{node['wkhtmltopdf']['arch']}`
binary_url | URL to download static binary | String | `#{node['wkhtmltopdf']['mirror_url']}/#{node['wkhtmltopdf']['wkhtmltoimage']['binary_full_name']}.tar.bz2`

### wkhtmltopdf Attributes

These attributes are under the `node['wkhtmltopdf']['wkhtmltopdf']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
binary_extracted_name | Extracted name of static binary | String | `wkhtmltopdf-#{node['wkhtmltopdf']['arch']}`
binary_full_name | Full name of static binary | String | `wkhtmltopdf-#{node['wkhtmltopdf']['version']}-static-#{node['wkhtmltopdf']['arch']}`
binary_url | URL to download static binary | String | `#{node['wkhtmltopdf']['mirror_url']}/#{node['wkhtmltopdf']['wkhtmltopdf']['binary_full_name']}.tar.bz2`

## Recipes

* `recipe[wkhtmltopdf]` Installs wkhtmltoimage and wkhtmltopdf static binaries
* `recipe[wkhtmltopdf::wkhtmltoimage_binary]` Installs wkhtmltoimage static binary
* `recipe[wkhtmltopdf::wkhtmltopdf_binary]` Installs wkhtmltopdf static binary

## Usage

* Add recipe(s) to node's run list

## Testing and Development

Here's how you can quickly get testing or developing against the cookbook thanks to [Vagrant](http://vagrantup.com/) and [Berkshelf](http://berkshelf.com/).

    gem install bundler --no-ri --no-rdoc
    git clone git://github.com/bflad/chef-wkhtmltopdf.git
    cd chef-wkhtmltopdf
    bundle install
    bundle exec vagrant up BOX # BOX being centos6 or ubuntu1204

You can then SSH into the running VM using the `vagrant ssh` command.
The VM can easily be stopped and deleted with the `vagrant destroy`
command. Please see the official [Vagrant documentation](http://vagrantup.com/v1/docs/commands.html)
for a more in depth explanation of available commands.

## Contributing

Please use standard Github issues/pull requests and if possible, in combination with testing on the Vagrant boxes.

## License and Author

Author:: Brian Flad (<bflad417@gmail.com>)

Copyright:: 2013

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
