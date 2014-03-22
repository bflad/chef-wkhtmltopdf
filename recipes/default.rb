include_recipe 'apt' if node['platform_family'] == 'debian'

node['wkhtmltopdf']['dependency_packages'].each do |p|
  package p
end

include_recipe 'wkhtmltopdf::binary'
