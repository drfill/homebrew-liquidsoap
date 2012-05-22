require 'formula'

class Liquidsoap < Formula
  url 'http://sourceforge.net/projects/savonet/files/liquidsoap/1.0.0/liquidsoap-1.0.0.tar.bz2'
  homepage 'http://liquidsoap.fm/'
  md5 'de6e8530b128e5db213459be5b24659f'

  unless MacOS.snow_leopard? or MacOS.lion? or MacOS.mountain_lion?
    onoe 'Sorry!'
    onoe 'We currently does not support MacOSX older than 10.6, '
    onoe 'try old Macports way described here -> http://savonet.sourceforge.net/macports.html'
    exit
  end

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-dtools' => :build
  depends_on 'ocaml-duppy' => :build
  depends_on 'ocaml-mm' => :build
  depends_on 'ocaml-cry' => :build
  depends_on 'ocaml-pcre'
  depends_on 'ocaml-camomile'
  depends_on 'ocaml-magic'
  depends_on 'ocaml-yojson'
  depends_on 'ocaml-ao'
  depends_on 'ocaml-ogg'
  depends_on 'ocaml-vorbis'
  depends_on 'ocaml-mad'
  depends_on 'ocaml-taglib'
  depends_on 'ocaml-lame' if Hardware.is_64_bit?
  depends_on 'ocaml-flac'
  depends_on 'ocaml-faad'
  depends_on 'ocaml-speex'
  depends_on 'ocaml-theora'
  depends_on 'ocaml-schroedinger'
  # depends_on 'ocaml-sdl'
  depends_on 'ocaml-speex'
  depends_on "ocaml-samplerate" if ARGV.include? "--with-samplerate" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on "ocaml-xmlm" if ARGV.include? "--with-lastfm" or ARGV.include? "--with-xmlplaylist" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on "ocaml-lastfm" if ARGV.include? "--with-lastfm" or ARGV.include? "--with-xmlplaylist" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on "ocaml-xmlplaylist" if ARGV.include? "--with-xmlplaylist" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on "ocaml-soundtouch" if ARGV.include? "--with-soundtouch" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on "ocaml-aacplus" if ARGV.include? "--with-aacplus" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on "ocaml-voaacenc" if ARGV.include? "--with-aac" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on 'ocaml-lo' if ARGV.include? "--with-lo" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on "ocaml-camlimages" if ARGV.include? "--with-video-processing" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on "ocaml-gavl" if ARGV.include? "--with-video-processing" or ARGV.include? "--with-all" or ARGV.build_head?
  # depends_on 'ocaml-gstreamer' if ARGV.include? "--with-gstreamer" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on 'ffmpeg' if ARGV.include? "--with-ffmpeg" or ARGV.include? "--with-all" or ARGV.build_head?
  depends_on 'ocaml-portaudio' if ARGV.include? "--with-all" or ARGV.build_head?
  depends_on 'ocaml-bjack' if ARGV.include? "--with-all" or ARGV.build_head?
  depends_on 'ocaml-ladspa' if ARGV.include? "--with-all" or ARGV.build_head?

  def options
    [['--with-samplerate', "Enables Samplerate library support"],
    ['--with-xmlplaylist', "Enables XmlPlaylist support"],
    ['--with-lastfm', "Enables LAST.fm support"],
    ['--with-soundtouch', "Enables Soundtouch library support"],
    ['--with-aac', "Enables AAC library support"],
    ['--with-aacplus', "Enables AAC+ library support"],
    ['--with-lo', "Enables lo library support"],
    ['--with-video-processing', "Enables video processing modules"],
    # ['--with-gstreamer', "Enables GStreamer processing modules"],
    ['--with-ffmpeg', "Enables FFmpeg support"],
    ['--with-all', "Includes all available modules in Liquidsoap"],]
  end
  
  def install
    ENV['MAKEFLAGS'] = "-j2"
    ENV['OCAMLPATH'] = "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
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

# __END__
# cp 'PACKAGES.minimal', 'PACKAGES'
# system "./bootstrap" if ARGV.build_head?

# inreplace 'PACKAGES', 'ocaml-ao', '#ocaml-ao'
# inreplace 'PACKAGES', 'ocaml-ogg', '#ocaml-ogg'
# inreplace 'PACKAGES', 'ocaml-vorbis', '#ocaml-vorbis'
# inreplace 'PACKAGES', 'ocaml-mad', '#ocaml-mad'
# inreplace 'PACKAGES', 'ocaml-taglib', '#ocaml-taglib'
# inreplace 'PACKAGES', 'ocaml-lame', '#ocaml-lame' if Hardware.is_64_bit?
# inreplace 'PACKAGES', 'ocaml-flac', '#ocaml-flac'
# inreplace 'PACKAGES', '#ocaml-faad', 'ocaml-faad'
# inreplace 'PACKAGES', '#ocaml-speex', 'ocaml-speex'
# inreplace 'PACKAGES', '#ocaml-theora', 'ocaml-theora'
# inreplace 'PACKAGES', '#ocaml-schroedinger', 'ocaml-schroedinger'
# inreplace 'PACKAGES', '#ocaml-samplerate', 'ocaml-samplerate' if ARGV.include? "--with-samplerate" or ARGV.include? "--with-all"
# inreplace 'PACKAGES', '#ocaml-xmlplaylist', 'ocaml-xmlplaylist' if ARGV.include? "--with-xmlplaylist" or ARGV.include? "--with-lastfm" or ARGV.include? "--with-all"
# inreplace 'PACKAGES', '#ocaml-lastfm', 'ocaml-lastfm' if ARGV.include? "--with-lastfm" or ARGV.include? "--with-all"
# inreplace 'PACKAGES', '#ocaml-soundtouch', 'ocaml-soundtouch' if ARGV.include? "--with-soundtouch" or ARGV.include? "--with-all"
# inreplace 'PACKAGES', '#ocaml-aacplus', 'ocaml-aacplus' if ARGV.include? "--with-aacplus" or ARGV.include? "--with-all"
# inreplace 'PACKAGES', '#ocaml-voaacenc', 'ocaml-voaacenc' if ARGV.include? "--with-aac" or ARGV.include? "--with-all"
# inreplace 'PACKAGES', '#ocaml-lo', 'ocaml-lo' if ARGV.include? "--with-lo" or ARGV.include? "--with-all"
# inreplace 'PACKAGES', '#ocaml-gavl', 'ocaml-gavl' if ARGV.include? "--with-video-processing" or ARGV.include? "--with-all"

# * Supported input formats
#    - Vorbis            : yes
#    - Theora            : yes
#    - Speex             : yes
#    - Dirac             : yes
#    - Flac (native)     : yes
#    - Flac (ogg)        : yes
#    - MP3               : yes
#    - AAC               : yes
#    - text-to-speech    : requires text2wave (festival) and sox at runtime
#    - XML playlists     : yes
#    - Lastfm            : yes
# 
#  * Supported output formats
#    - Vorbis            : yes
#    - MP3               : yes
#    - AAC               : yes
#    - AAC+              : yes
#    - SPEEX             : yes
#    - Theora            : yes
#    - Dirac             : yes
# 
#  * Tags
#    - Taglib (ID3 tags) : yes
#    - Vorbis            : yes
#    - charset detection : yes
# 
#  * Input / output
#    - Icecast/Shoutcast : yes
#    - AO                : yes
#    - OSS               : no
#    - ALSA              : no (requires alsa)
#    - Portaudio         : yes
#    - Pulseaudio        : no (requires pulseaudio)
#    - JACK              : yes
#    - GStreamer         : no (requires gstreamer)
# 
#  * Audio manipulation
#    - Samplerate        : yes
#    - SoundTouch        : yes
#    - LADSPA            : yes
# 
#  * Video manipulation
#    - Gavl              : yes
#    - camlimages        : yes
# 
#  * MIDI manipulation
#    - DSSI              : no (requires dssi)
# 
#  * Visualization
#    - Graphics          : yes
#    - SDL               : no (requires sdl)
#    - GD                : no (requires gd)
# 
#  * Additional libraries
#    - dynlink           : no (not available)
#    - magic             : yes
#    - lo                : yes
#    - yojson            : yes
# 
#  * Graphical interfaces
#    - Python GUI        : no