require 'formula'

class LadspaHeader < Formula
  homepage 'http://www.ladspa.org/'
  url 'https://web.archive.org/web/20150529032654/http://www.ladspa.org/ladspa_sdk/ladspa.h.txt'
  sha256 'c72ceb7383f159a944bfe80b1b155795857026aea1155dbe4ecf1664354320ad'
  version '1.1'

  def install
    mkdir_p "#{include}"
    cp_r "ladspa.h.txt", "#{include}/ladspa.h"
  end
end
