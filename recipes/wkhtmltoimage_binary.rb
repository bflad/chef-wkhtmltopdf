cache_dir = Chef::Config[:file_cache_path]
download_dest = File.join(cache_dir, "#{node['wkhtmltopdf']['wkhtmltoimage']['binary_full_name']}.tar.xz")

remote_file download_dest do
  source node['wkhtmltopdf']['mirror_url']
  mode '0644'
  action :create_if_missing
end

execute "Extract #{download_dest}" do
  cwd cache_dir
  command <<-COMMAND
    tar -xJf #{download_dest}
  COMMAND
  creates File.join(cache_dir, node['wkhtmltopdf']['wkhtmltoimage']['binary_extracted_name'])
end

execute "Copy wkhtmltoimage to #{node['wkhtmltopdf']['install_dir']}" do
  cwd cache_dir
  command <<-COMMAND
    cp wkhtmltox/bin/#{node['wkhtmltopdf']['wkhtmltoimage']['binary_extracted_name']} #{node['wkhtmltopdf']['install_dir']}/wkhtmltoimage
  COMMAND
  creates "#{node['wkhtmltopdf']['install_dir']}/wkhtmltoimage"
end
