cache_dir = Chef::Config[:file_cache_path]
download_dest = File.join(cache_dir, node['wkhtmltopdf']['archive'])
clean_version =  if (match = /^(\d+)\.(\d+)\.(\d+)/.match(node['wkhtmltopdf']['version']))
    "#{match[1]}.#{match[2]}.#{match[3]}"
  elsif (match = /^(\d+)\.(\d+)/.match(node['wkhtmltopdf']['version']))
        "#{match[1]}.#{match[2]}"
  else
    node['wkhtmltopdf']['version']
  end 
wkhtmltopdf_version = Chef::Version.new(clean_version)


remote_file download_dest do
  source node['wkhtmltopdf']['mirror_url']
  mode '0644'
  action :create_if_missing
end

execute 'extract_wkhtmltopdf' do
  cwd cache_dir
  command "tar -xJf #{download_dest}"
  creates File.join(cache_dir, 'wkhtmltox')
end

execute 'install_wkhtmltoimage' do
  cwd cache_dir
  command "cp wkhtmltox/bin/wkhtmltoimage #{node['wkhtmltopdf']['install_dir']}/wkhtmltoimage"
  creates "#{node['wkhtmltopdf']['install_dir']}/wkhtmltoimage"
end

execute 'install_wkhtmltopdf' do
  cwd cache_dir
  command "cp wkhtmltox/bin/wkhtmltopdf #{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf"
  creates "#{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf"
end

unless node['wkhtmltopdf']['lib_dir'].empty?
  execute 'install_wkhtmltox_so' do
    cwd cache_dir
    command "cp wkhtmltox/lib/libwkhtmltox.so.#{node['wkhtmltopdf']['version']} #{node['wkhtmltopdf']['lib_dir']}/libwkhtmltox.so.#{node['wkhtmltopdf']['version']}"
    creates "#{node['wkhtmltopdf']['lib_dir']}/libwkhtmltox.so.#{node['wkhtmltopdf']['version']}"
  end

  link "#{node['wkhtmltopdf']['lib_dir']}/libwkhtmltox.so.#{wkhtmltopdf_version.major}.#{wkhtmltopdf_version.minor}" do
    to "#{node['wkhtmltopdf']['lib_dir']}/libwkhtmltox.so.#{node['wkhtmltopdf']['version']}"
  end

  link "#{node['wkhtmltopdf']['lib_dir']}/libwkhtmltox.so.#{wkhtmltopdf_version.major}" do
    to "#{node['wkhtmltopdf']['lib_dir']}/libwkhtmltox.so.#{node['wkhtmltopdf']['version']}"
  end
end
