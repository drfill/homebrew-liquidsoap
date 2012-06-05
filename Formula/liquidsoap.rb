require 'formula'

def gd?
  ARGV.include? '--with-gd' or ARGV.include? '--with-all'
end

def samplerate?
  ARGV.include? '--with-samplerate' or ARGV.include? '--with-all'
end

def xmlm?
  ARGV.include? '--with-samplerate' or ARGV.include? '--with-all'
end

def lastfm?
  ARGV.include? '--with-lastfm' or ARGV.include? '--with-all'
end

def xmlplaylist?
  ARGV.include? '--with-xmlplaylist' or ARGV.include? '--with-all' or ARGV.include? '--with-lastfm'
end

def soundtouch?
  ARGV.include? '--with-soundtouch' or ARGV.include? '--with-all'
end

def aacplus?
  ARGV.include? '--with-aacplus' or ARGV.include? '--with-all'
end

def aac?
  ARGV.include? '--with-aac' or ARGV.include? '--with-all'
end

def lo?
  ARGV.include? '--with-lo' or ARGV.include? '--with-all'
end

def video_processing?
  ARGV.include? '--with-video-processing' or ARGV.include? '--with-all'
end

def ffmpeg?
  ARGV.include? '--with-ffmpeg' or ARGV.include? '--with-all'
end

def speech?
  ARGV.include? '--with-speech' or ARGV.include? '--with-all'
end

def sdl?
  ARGV.include? '--with-sdl' or ARGV.include? '--with-all'
end

def gstreamer?
  ARGV.include? '--with-gstreamer' or ARGV.include? '--with-all'
end

def lame?
  ARGV.include? '--with-mp3' or ARGV.include? '--with-all'
end

def bjack?
  ARGV.include? '--with-bjack' or ARGV.include? '--with-all'
end

def ladspa?
  ARGV.include? '--with-ladspa' or ARGV.include? '--with-all'
end

def portaudio?
  ARGV.include? '--with-portaudio' or ARGV.include? '--with-all'
end

def soundtouch?
  ARGV.include? '--with-soundtouch' or ARGV.include? '--with-all'
end

def build_doc?
  ARGV.include? '--with-doc'
end

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

  # Defaults
  args = [
    "--with-dtools",
    "--with-duppy",
    "--with-mm",
    "--with-pcre",
    "--with-camomile",
    "--with-magic",
    "--with-yojson",
    "--with-ao", # till 1.0.1
    "--with-ogg",
    "--with-vorbis", # till 1.0.1
    "--with-mad", # till 1.0.1
    "--with-taglib", # till 1.0.1, enables when lame installed
    "--with-lame", # till 1.0.1
    "--with-flac", # till 1.0.1
    "--with-faad", # till 1.0.1
    "--with-speex", # till 1.0.1
    "--with-theora", # till 1.0.1
    "--with-schroedinger", # till 1.0.1
    "--with-cry", # till 1.0.1
  ]

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-dtools' => :build
  depends_on 'ocaml-duppy' => :build
  depends_on 'ocaml-cry' # This package contains an OCaml low level implementation of the shout protocol. --with-shout in 1.0.1 version
  depends_on 'ocaml-pcre'
  depends_on 'ocaml-camomile'
  depends_on 'ocaml-magic'
  depends_on 'ocaml-yojson'
  depends_on 'ocaml-ao'
  depends_on 'ocaml-ogg'
  depends_on 'ocaml-vorbis'
  depends_on 'ocaml-mad'
  depends_on 'ocaml-taglib'
  depends_on 'ocaml-lame' if Hardware.is_64_bit? and lame?
  depends_on 'ocaml-flac'
  depends_on 'ocaml-faad'
  depends_on 'ocaml-speex'
  depends_on 'ocaml-theora'
  depends_on 'ocaml-schroedinger'
  # depends_on 'ocaml-sdl' if sdl?
  depends_on 'ocaml-speex'
  depends_on 'ocaml-gd4o' if gd?
  depends_on "ocaml-samplerate" if samplerate?
  depends_on "ocaml-xmlm" if lastfm? or xmlplaylist?
  depends_on "ocaml-lastfm" if lastfm?
  depends_on "ocaml-xmlplaylist" if xmlplaylist?
  depends_on "ocaml-soundtouch" if soundtouch?
  depends_on "ocaml-aacplus" if aacplus?
  depends_on "ocaml-voaacenc" if aac?
  depends_on 'ocaml-lo' if lo?
  depends_on "ocaml-camlimages" if video_processing?
  depends_on "ocaml-gavl" if video_processing?
  # depends_on 'ocaml-gstreamer' if gstreamer?
  depends_on 'ffmpeg' if ffmpeg?
  depends_on 'ocaml-portaudio' if portaudio?
  depends_on 'ocaml-bjack' if bjack?
  depends_on 'ocaml-ladspa' if ladspa?
  depends_on 'sox' if speech?
  depends_on 'festival' if speech?
  depends_on 'XML::DOM' => :perl if build_doc?
  depends_on 'ocaml-mm' => :build

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
    # ['--with-sdl', "Enables SDL MIDI processing modules"],
    ['--with-ffmpeg', "Enables FFmpeg support"],
    ['--with-speech', "Enables Festival speech support (experimental)"],
    ['--with-gd', "Enables GD library support"],
    ['--with-mp3', "Enables Lame MP3 library support"],
    ['--with-bjack', "Enables JACK Sound processing library support"],
    ['--with-ladspa', "Enables LADSPA Sound processing plugins"],
    ['--with-portaudio', "Enables PortAudio Sound library"],
    ['--with-all', "Includes all available modules in Liquidsoap"],
    ['--with-doc', "Build documentation for Liquidsoap"],]
  end

  def install
    ENV.append 'MAKEFLAGS', "-j2"
    ENV.append 'OCAMLPATH', "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append 'OCAMLFIND_DESTDIR', "#{lib}/ocaml/site-lib"
    inreplace "configure", "dummy text2wave", "dummy text2wave.sh" if ARGV.include? "--with-speech" or ARGV.include? "--with-all"
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make', 'doc' if build_doc?
    remove_file 'INSTALL'
    system 'make', 'install'
  end

  def test
    # * Supported input formats
    #    - Vorbis            : yes
    #    - Theora            : yes
    #    - Speex             : yes
    #    - Dirac             : yes
    #    - Flac (native)     : yes
    #    - Flac (ogg)        : yes
    #    - MP3               : yes
    #    - AAC               : yes
    #    - text-to-speech    : yes
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
    #    - GD                : yes
    #
    #  * Additional libraries
    #    - dynlink           : no (not available)
    #    - magic             : yes
    #    - lo                : yes
    #    - yojson            : yes
    #
    #  * Graphical interfaces
    #    - Python GUI        : no
    system "#{bin}/liquidsoap --version"
  end
end
