cache_dir = Chef::Config[:file_cache_path]
download_dest = File.join(cache_dir, "#{node['wkhtmltopdf']['wkhtmltopdf']['binary_full_name']}.tar.bz2")

packages = value_for_platform_family(
  ['debian'] => %w(libxrender1 libxext6 libfontconfig1),
  ['fedora','rhel'] => %w(libXrender libXext urw-fonts openssl-devel fontconfig-devel)
)

packages.each do |pkg|
  package pkg
end

remote_file download_dest do
  source node['wkhtmltopdf']['wkhtmltopdf']['binary_url']
  mode '0644'
  action :create_if_missing
end

execute "Extract #{download_dest}" do
  cwd cache_dir
  command <<-COMMAND
    tar jxvf #{download_dest}
  COMMAND
  creates File.join(cache_dir, node['wkhtmltopdf']['wkhtmltopdf']['binary_extracted_name'])
end

execute "Copy wkhtmltopdf to #{node['wkhtmltopdf']['install_dir']}" do
  cwd cache_dir
  command <<-COMMAND
    cp #{node['wkhtmltopdf']['wkhtmltopdf']['binary_extracted_name']} #{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf
  COMMAND
  creates "#{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf"
end
