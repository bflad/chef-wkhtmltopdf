default['wkhtmltopdf']['version']        = '0.12.1'
default['wkhtmltopdf']['install_method'] = 'binary'

case node['platform_family']
when 'mac_os_x', 'mac_os_x_server'
  default['wkhtmltopdf']['dependency_packages'] = []
  default['wkhtmltopdf']['suffix'] = 'pkg'
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['platform'] = 'osx-cocoa'
    default['wkhtmltopdf']['architecture'] = 'x86_64'
  else
    default['wkhtmltopdf']['platform'] = 'osx-carbon'
    default['wkhtmltopdf']['architecture'] = 'i386'
  end

when 'windows'
  default['wkhtmltopdf']['dependency_packages'] = []
  default['wkhtmltopdf']['suffix'] = 'exe'
  default['wkhtmltopdf']['platform'] = 'mingw-w64-cross'
  # or default['wkhtmltopdf']['platform'] = 'msvc2013'
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['architecture'] = 'win64'
  else
    default['wkhtmltopdf']['architecture'] = 'win32'
  end

when 'debian'
  platform_version = node[:platform_version].to_f
  default['wkhtmltopdf']['dependency_packages'] = %w(libfontconfig1 libssl0.9.8 libxext6 libxrender1)
  default['wkhtmltopdf']['suffix'] = 'deb'
  if platform?('debian')
    default['wkhtmltopdf']['platform'] = 'linux-wheezy'
  elsif platform?('ubuntu') && platform_version >= 14.0
    default['wkhtmltopdf']['platform'] = 'linux-trusty'
  elsif platform?('ubuntu') && platform_version >= 12.0
    default['wkhtmltopdf']['platform'] = 'linux-trusty'
  end
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['architecture'] = 'amd64'
  else
    default['wkhtmltopdf']['architecture'] = 'i386'
  end

when 'rhel'
  platform_version = node[:platform_version].to_f
  default['wkhtmltopdf']['dependency_packages'] = %w(fontconfig libXext libXrender openssl-devel urw-fonts)
  default['wkhtmltopdf']['suffix'] = 'rpm'
  if platform_version >= 6.0
    default['wkhtmltopdf']['platform'] = 'linux-centos6'
  else
    default['wkhtmltopdf']['platform'] = 'linux-centos5'
  end
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['architecture'] = 'amd64'
  else
    default['wkhtmltopdf']['architecture'] = 'i386'
  end

else
  default['wkhtmltopdf']['install_method'] = 'source'
  default['wkhtmltopdf']['dependency_packages'] = []
  default['wkhtmltopdf']['suffix'] = 'tar.bz2'
  default['wkhtmltopdf']['platform'] = ''
  default['wkhtmltopdf']['architecture'] = ''
end

default['wkhtmltopdf']['archive']     = "wkhtmltox-#{node['wkhtmltopdf']['version']}_#{node['wkhtmltopdf']['platform']}-#{node['wkhtmltopdf']['architecture']}.#{node['wkhtmltopdf']['suffix']}"
default['wkhtmltopdf']['mirror_url']  = "http://downloads.sourceforge.net/project/wkhtmltopdf/#{node['wkhtmltopdf']['version']}/#{node['wkhtmltopdf']['archive']}"
