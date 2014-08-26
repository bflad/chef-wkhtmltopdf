default['wkhtmltopdf']['version']     = '0.12.1'

default['wkhtmltopdf']['package']     = "wkhtmltox-#{node['wkhtmltopdf']['version']}_linux-precise-amd64.deb.deb"
default['wkhtmltopdf']['mirror_url']  = "http://downloads.sourceforge.net/project/wkhtmltopdf/#{node['wkhtmltopdf']['version']}/#{node['wkhtmltopdf']['package']}"
