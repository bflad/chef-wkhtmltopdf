cache_dir = Chef::Config[:file_cache_path]
download_dest = File.join(cache_dir, "#{node['wkhtmltopdf']['wkhtmltopdf']['binary_full_name']}.tar.xz")

packages = value_for_platform_family(
  %w(debian) => %w(libxrender1 libxext6 libfontconfig1),
  %w(fedora rhel) => %w(libXrender libXext urw-fonts openssl-devel fontconfig-devel)
)

packages.each do |pkg|
  package pkg
end

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
  creates File.join(cache_dir, node['wkhtmltopdf']['wkhtmltopdf']['binary_extracted_name'])
end

execute "Copy wkhtmltopdf to #{node['wkhtmltopdf']['install_dir']}" do
  cwd cache_dir
  command <<-COMMAND
    cp wkhtmltox/bin/#{node['wkhtmltopdf']['wkhtmltopdf']['binary_extracted_name']} #{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf
  COMMAND
  creates "#{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf"
end
