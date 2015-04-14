require 'formula'

class OcamlCppo < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/cppo-0.9.2.tar.gz'
  sha256 'ee4693b16e82e0d7f9b955dc6d935c518958fdd87b8e9402cc54a52e6e03897f'

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
