# Upcoming wkhtmlpdf version is '0.12.1' with the github sha '2b560d5'
#
default['wkhtmltopdf']['version']     = '0.12.0'
default['wkhtmltopdf']['build_sha']   = '03c001d'
default['wkhtmltopdf']['install_dir'] = '/usr/local/bin'
default['wkhtmltopdf']['lib_dir']     = ''

case node['platform_family']
when 'mac_os_x', 'mac_os_x_server'
  default['wkhtmltopdf']['dependency_packages'] = []
  default['wkhtmltopdf']['platform'] = 'macosx-10.9.1-x86_64'
when 'windows'
  default['wkhtmltopdf']['dependency_packages'] = []
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['platform'] = 'win64'
  else
    default['wkhtmltopdf']['platform'] = 'win32'
  end
else
  default['wkhtmltopdf']['dependency_packages'] = value_for_platform_family(
    %w(debian) => %w(libfontconfig1 libssl1.0.0 libxext6 libxrender1),
    %w(fedora rhel) => %w(fontconfig libXext libXrender openssl-devel urw-fonts)
  )
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['platform'] = 'linux-amd64'
  else
    default['wkhtmltopdf']['platform'] = 'linux-i386'
  end
end

# The sourceforge path for amd64 version http://downloads.sourceforge.net/project/wkhtmltopdf/archive/0.12.0/wkhtmltox-linux-amd64_0.12.0-03c001d.tar.xz?r=&ts=1408209123&use_mirror=heanet
#
default['wkhtmltopdf']['archive']     = "wkhtmltox-#{node['wkhtmltopdf']['platform']}_#{node['wkhtmltopdf']['version']}-#{node['wkhtmltopdf']['build_sha']}.tar.xz"
default['wkhtmltopdf']['mirror_url']  = "http://downloads.sourceforge.net/project/wkhtmltopdf/archive/#{node['wkhtmltopdf']['version']}/#{node['wkhtmltopdf']['archive']}?r=&ts=1408209123&use_mirror=heanet"
