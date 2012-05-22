require 'formula'

class OcamlSdl < Formula
  homepage 'http://ocamlsdl.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/ocamlsdl/OCamlSDL/ocamlsdl-0.8.0/ocamlsdl-0.8.0.tar.gz'
  md5 'b7ee334cf107867cc8d08cbcc319c9af'

  depends_on 'objective-caml' => :build
  depends_on 'sdl' => :build
  depends_on 'sdl_image' => :build
  depends_on 'sdl_mixer' => :build
  depends_on 'sdl_gfx' => :build
  depends_on 'sdl_ttf' => :build

  def install
    ENV.llvm if MacOS.xcode_version >= "4.2"
    ENV.gcc if MacOS.xcode_version < "4.2"
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system './configure', "--prefix=#{prefix}"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make", "install"
  end
end
