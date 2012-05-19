require 'formula'

class Liquidsoap < Formula
  url 'http://sourceforge.net/projects/savonet/files/liquidsoap/1.0.0/liquidsoap-1.0.0-full.tar.bz2'
  homepage 'http://liquidsoap.fm/'
  md5 'e379caaf68b1141b0b34bdb3db14ab69'
  head 'http://savonet.hg.sourceforge.net:8000/hgroot/savonet/savonet', :using => :hg

  unless MacOS.snow_leopard? or MacOS.lion?
    onoe 'Sorry!'
    onoe 'We currently does not support MacOSX older than 10.6, '
    onoe 'try old Macports way described here -> http://savonet.sourceforge.net/macports.html'
    exit
  end

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'pcre-ocaml' => :build
  depends_on 'camomile'
  depends_on 'ocaml-magic' => :optional
  depends_on 'yojson' => :optional
  depends_on 'libao' => :optional
  depends_on 'libogg' => :optional
  depends_on 'libvorbis' => :optional
  depends_on 'mad' => :optional
  depends_on 'taglib' => :optional
  depends_on 'lame' => :optional if Hardware.is_64_bit?
  depends_on 'flac' => :optional
  depends_on 'faad2' => :optional
  depends_on 'speex' => :optional
  depends_on 'theora' => :optional
  depends_on 'schroedinger' => :optional
  depends_on "libsamplerate" if ARGV.include? "--with-samplerate"
  depends_on "xmlm" if ARGV.include? "--with-lastfm" or ARGV.include? "--with-xmlplaylist"
  depends_on "sound-touch" if ARGV.include? "--with-soundtouch" and Hardware.is_32_bit?
  depends_on "libaacplus" if ARGV.include? "--with-aacplus"
  depends_on "vo-aacenc" if ARGV.include? "--with-aac"

  def options
    [['--with-samplerate', "Enables Samplerate library support"],
    ['--with-xmlplaylist', "Enables XmlPlaylist support"],
    ['--with-lastfm', "Enables LAST.fm support"],
    ['--with-soundtouch', "Enables Soundtouch library support"],
    ['--with-aac', "Enables AAC library support"],
    ['--with-aacplus', "Enables AAC+ library support"],]
  end

  def install
    ENV.llvm if MacOS.xcode_version >= "4.2" and ARGV.include? '--with-aacplus' # This fields contains dirty hack
    ENV.gcc if MacOS.xcode_version < "4.2" and ARGV.include? '--with-aacplus'   # to provide ability install liquidsoap with aacplus library
    ENV['MAKEFLAGS'] = "-j2"
    cp 'PACKAGES.minimal', 'PACKAGES'
    system "./bootstrap" if ARGV.build_head?
    inreplace 'PACKAGES', 'ocaml-ao', '#ocaml-ao'  unless Formula.factory('libao').installed?
    inreplace 'PACKAGES', 'ocaml-ogg', '#ocaml-ogg'  unless Formula.factory('libogg').installed?
    inreplace 'PACKAGES', 'ocaml-vorbis', '#ocaml-vorbis'  unless Formula.factory('libvorbis').installed?
    inreplace 'PACKAGES', 'ocaml-mad', '#ocaml-mad'  unless Formula.factory('mad').installed?
    inreplace 'PACKAGES', 'ocaml-taglib', '#ocaml-taglib'  unless Formula.factory('taglib').installed?
    inreplace 'PACKAGES', 'ocaml-lame', '#ocaml-lame'  unless Formula.factory('lame').installed? and Hardware.is_64_bit?
    inreplace 'PACKAGES', 'ocaml-flac', '#ocaml-flac'  unless Formula.factory('flac').installed?
    inreplace 'PACKAGES', '#ocaml-faad', 'ocaml-faad'  if Formula.factory('faad2').installed?
    inreplace 'PACKAGES', '#ocaml-speex', 'ocaml-speex' if Formula.factory('speex').installed?
    inreplace 'PACKAGES', '#ocaml-theora', 'ocaml-theora'  if Formula.factory('theora').installed?
    inreplace 'PACKAGES', '#ocaml-schroedinger', 'ocaml-schroedinger' if Formula.factory('schroedinger').installed?
    inreplace 'PACKAGES', '#ocaml-samplerate', 'ocaml-samplerate' if ARGV.include? "--with-samplerate"
    inreplace 'PACKAGES', '#ocaml-xmlplaylist', 'ocaml-xmlplaylist' if ARGV.include? "--with-xmlplaylist" or ARGV.include? "--with-lastfm"
    inreplace 'PACKAGES', '#ocaml-lastfm', 'ocaml-lastfm' if ARGV.include? "--with-lastfm"
    inreplace 'PACKAGES', '#ocaml-soundtouch', 'ocaml-soundtouch' if ARGV.include? "--with-soundtouch" and Hardware.is_32_bit?
    inreplace 'PACKAGES', '#ocaml-aacplus', 'ocaml-aacplus' if ARGV.include? "--with-aacplus"
    inreplace 'PACKAGES', '#ocaml-voaacenc', 'ocaml-voaacenc' if ARGV.include? "--with-aac"
    mkdir_p "#{lib}"
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make', 'doc'
    remove_file 'INSTALL'
    system 'make', 'install'
  end

  def test
    system "#{bin}/liquidsoap --version"
  end
end
