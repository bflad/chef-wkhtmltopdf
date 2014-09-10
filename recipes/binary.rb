cache_dir = Chef::Config[:file_cache_path]
download_dest = File.join(cache_dir, node['wkhtmltopdf']['package'])
wkhtmltopdf_version = Chef::Version.new(node['wkhtmltopdf']['version'])

remote_file download_dest do
  source node['wkhtmltopdf']['mirror_url']
  mode '0644'
  action :create_if_missing
end

execute 'install wkhtmltopdf' do
  cwd cache_dir
  command "dpkg -i #{download_dest}"
  not_if "/usr/local/bin/wkhtmltopdf --version | grep #{wkhtmltopdf_version}"
end
