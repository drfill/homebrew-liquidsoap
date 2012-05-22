require 'formula'

class LadspaHeader < Formula
  homepage 'http://www.ladspa.org/'
  url 'http://www.ladspa.org/ladspa_sdk/ladspa.h.txt'
  md5 '7550280c79d24228361a9762b63e5b7e'
  version '1.1'

  def install
    mkdir_p "#{include}"
    cp_r "ladspa.h.txt", "#{include}/ladspa.h"
  end
end
