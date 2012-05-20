require 'formula'

class Cppo < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/cppo-0.9.2.tar.gz'
  md5 '8c583440a69762165ef82bfab65fe021'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'

  def install
    ENV.j1
    ENV['PREFIX'] = prefix
    system 'make'
    mkdir_p "#{prefix}/bin"
    system "make", "install"
  end
end
