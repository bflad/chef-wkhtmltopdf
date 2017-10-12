default['wkhtmltopdf']['version']     = '0.12.3'
default['wkhtmltopdf']['install_dir'] = '/usr/local/bin'
default['wkhtmltopdf']['lib_dir']     = ''

case node['platform_family']
when 'mac_os_x', 'mac_os_x_server'
  default['wkhtmltopdf']['dependency_packages'] = []
  default['wkhtmltopdf']['platform'] = 'osx-cocoa-x86-64.pkg'
when 'windows'
  default['wkhtmltopdf']['dependency_packages'] = []
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['platform'] = 'msvc2015-win64.exe'
  else
    default['wkhtmltopdf']['platform'] = 'msvc2015-win32.exe'
  end
else
  default['wkhtmltopdf']['dependency_packages'] = value_for_platform_family(
    %w(debian) => %w(zlib1g-dev libfontconfig1 libfreetype6-dev libx11-dev libxext6 libxrender1),
    %w(fedora rhel) => %w(fontconfig libXext libXrender openssl-devel urw-fonts)
  )
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['platform'] = 'linux-generic-amd64.tar.xz'
  else
    default['wkhtmltopdf']['platform'] = 'linux-generic-i386.tar.xz'
  end
end

default['wkhtmltopdf']['archive']     = "wkhtmltox-#{node['wkhtmltopdf']['version']}_#{node['wkhtmltopdf']['platform']}"
default['wkhtmltopdf']['mirror_url']  = "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/#{node['wkhtmltopdf']['version']}/#{node['wkhtmltopdf']['archive']}"
