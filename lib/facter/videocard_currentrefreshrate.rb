Facter.add(:videocard_currentrefreshrate) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select CurrentRefreshRate from Win32_VideoController')
    query.each do |controller|
      result = controller.CurrentRefreshRate
      break
    end
    result    
  end
end