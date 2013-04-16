if node['kernel']['machine'] == 'x86_64'
	default['wkhtmltopdf']['arch'] = 'amd64'
else
	default['wkhtmltopdf']['arch'] = 'i386'
end
default['wkhtmltopdf']['install_dir'] = "/usr/local/bin"
default['wkhtmltopdf']['mirror_url'] = "http://wkhtmltopdf.googlecode.com/files"
default['wkhtmltopdf']['version'] = '0.11.0_rc1'

# wkhtmltoimage
default['wkhtmltopdf']['wkhtmltoimage']['binary_extracted_name'] = "wkhtmltoimage-#{node['wkhtmltopdf']['arch']}"
default['wkhtmltopdf']['wkhtmltoimage']['binary_full_name'] = "wkhtmltoimage-#{node['wkhtmltopdf']['version']}-static-#{node['wkhtmltopdf']['arch']}"
default['wkhtmltopdf']['wkhtmltoimage']['binary_url'] = "#{node['wkhtmltopdf']['mirror_url']}/#{node['wkhtmltopdf']['wkhtmltoimage']['binary_full_name']}.tar.bz2"

# wkhtmltopdf
default['wkhtmltopdf']['wkhtmltopdf']['binary_extracted_name'] = "wkhtmltopdf-#{node['wkhtmltopdf']['arch']}"
default['wkhtmltopdf']['wkhtmltopdf']['binary_full_name'] = "wkhtmltopdf-#{node['wkhtmltopdf']['version']}-static-#{node['wkhtmltopdf']['arch']}"
default['wkhtmltopdf']['wkhtmltopdf']['binary_url'] = "#{node['wkhtmltopdf']['mirror_url']}/#{node['wkhtmltopdf']['wkhtmltopdf']['binary_full_name']}.tar.bz2"
