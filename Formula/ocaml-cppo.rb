require 'formula'

class OcamlCppo < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/cppo-0.9.2.tar.gz'
  md5 '8c583440a69762165ef82bfab65fe021'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.j1
    ENV.append "PREFIX", prefix
    system 'make'
    mkdir_p "#{bin}"
    system "make", "install"
  end
end
