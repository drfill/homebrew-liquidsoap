require 'formula'

class LadspaHeader < Formula
  homepage 'http://www.ladspa.org/'
  url 'http://www.ladspa.org/ladspa_sdk/ladspa.h.txt'
  sha256 '1bd380baaf018be5e05323c192444adf058ed8a35b8cbf4c8a11519fc81cb036'
  version '1.1'

  def install
    mkdir_p "#{include}"
    cp_r "ladspa.h.txt", "#{include}/ladspa.h"
  end
end
