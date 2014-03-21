if node['kernel']['machine'] == 'x86_64'
  default['wkhtmltopdf']['arch'] = 'amd64'
else
  default['wkhtmltopdf']['arch'] = 'i386'
end
default['wkhtmltopdf']['install_dir'] = '/usr/local/bin'
default['wkhtmltopdf']['version']     = '0.12.0'
default['wkhtmltopdf']['sha']         = '03c001d'
default['wkhtmltopdf']['mirror_url']  = "http://downloads.sourceforge.net/project/wkhtmltopdf/#{node['wkhtmltopdf']['version']}/wkhtmltox-linux-#{node['wkhtmltopdf']['arch']}_#{node['wkhtmltopdf']['version']}-#{node['wkhtmltopdf']['sha']}.tar.xz"

# wkhtmltoimage
default['wkhtmltopdf']['wkhtmltoimage']['binary_extracted_name'] = "wkhtmltoimage"
default['wkhtmltopdf']['wkhtmltoimage']['binary_full_name'] = "wkhtmltoimage-#{node['wkhtmltopdf']['version']}-static-#{node['wkhtmltopdf']['arch']}"

# wkhtmltopdf
default['wkhtmltopdf']['wkhtmltopdf']['binary_extracted_name'] = "wkhtmltopdf"
default['wkhtmltopdf']['wkhtmltopdf']['binary_full_name'] = "wkhtmltopdf-#{node['wkhtmltopdf']['version']}-static-#{node['wkhtmltopdf']['arch']}"
