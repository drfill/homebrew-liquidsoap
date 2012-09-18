require 'formula'
require 'etc'

# def gd?
#   ARGV.include? '--with-gd' or ARGV.include? '--with-all'
# end

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

def gstreamer?
  ARGV.include? '--with-gstreamer' or ARGV.include? '--with-all'
end

def mad?
  ARGV.include? '--with-mp3' or ARGV.include? '--with-all'
end

def mp3?
  (ARGV.include? '--with-mp3' or ARGV.include? '--with-all') and Hardware.is_64_bit?
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

def ao?
  ARGV.include? '--with-ao' or ARGV.include? '--with-all'
end

def flac?
  ARGV.include? '--with-flac' or ARGV.include? '--with-all'
end

def speex?
  ARGV.include? '--with-speex' or ARGV.include? '--with-all'
end

def theora?
  ARGV.include? '--with-theora' or ARGV.include? '--with-all'
end

def schroedinger?
  ARGV.include? '--with-dirac' or ARGV.include? '--with-all'
end

def cry?
  ARGV.include? '--with-shout' or ARGV.include? '--with-all'
end

def build_doc?
  ARGV.include? '--with-doc'
end

def inc_all?
  ARGV.include? '--with-all'
end

class Liquidsoap < Formula
  url 'http://sourceforge.net/projects/savonet/files/liquidsoap/1.0.1/liquidsoap-1.0.1.tar.bz2'
  homepage 'http://liquidsoap.fm/'
  md5 'c3a05596056d1c3f256e9c2e00f4ff27'

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
  depends_on 'ocaml-cry' if cry? # This package contains an OCaml low level implementation of the shout protocol.
  depends_on 'ocaml-pcre'
  depends_on 'ocaml-camomile'
  depends_on 'ocaml-magic'
  depends_on 'ocaml-yojson'
  depends_on 'ocaml-ao' if ao?
  depends_on 'ocaml-ogg'
  depends_on 'ocaml-vorbis'
  depends_on 'ocaml-mad' if mp3? or mad?
  depends_on 'ocaml-taglib' if mp3? or mad?
  depends_on 'ocaml-lame' if mp3?
  depends_on 'ocaml-flac' if flac?
  depends_on 'ocaml-faad' if aac?
  depends_on 'ocaml-speex' if speex?
  depends_on 'ocaml-theora' if theora? or video_processing?
  depends_on 'ocaml-schroedinger' if schroedinger? or video_processing?
  depends_on 'ocaml-gd4o' #if gd? or video_processing?
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
  depends_on 'ocaml-gstreamer' if gstreamer?
  depends_on 'ffmpeg' if ffmpeg?
  depends_on 'ocaml-portaudio' if portaudio?
  depends_on 'ocaml-bjack' if bjack?
  depends_on 'ocaml-ladspa' if ladspa?
  depends_on 'sox' if speech?
  depends_on 'festival' if speech?
  depends_on 'XML::DOM' => :perl if build_doc?

  depends_on 'ocaml-mm' => :build # Depends on all available

  def options
    [
      ['--with-samplerate', "Enables Samplerate library support"],
      ['--with-xmlplaylist', "Enables XmlPlaylist support"],
      ['--with-lastfm', "Enables LAST.fm support"],
      ['--with-soundtouch', "Enables Soundtouch library support"],
      ['--with-aac', "Enables AAC library support"],
      ['--with-aacplus', "Enables AAC+ library support"],
      ['--with-lo', "Enables lo library support"],
      ['--with-video-processing', "Enables video processing modules"],
      ['--with-gstreamer', "Enables GStreamer processing modules"],
      ['--with-ffmpeg', "Enables FFmpeg support"],
      ['--with-speech', "Enables Festival speech support (experimental)"],
      # ['--with-gd', "Enables GD library support"],
      ['--with-bjack', "Enables JACK Sound processing library support"],
      ['--with-ladspa', "Enables LADSPA Sound processing plugins"],
      ['--with-portaudio', "Enables PortAudio Sound library"],
      ['--with-all', "Includes all available modules in Liquidsoap"],
      ['--with-doc', "Build documentation for Liquidsoap"],
      ['--with-ao', "Enables libAO library support"],
      ['--with-flac', "Enables Flac library support"],
      ['--with-speex', "Enables SPEEX library support"],
      ['--with-theora', "Enables OGG Theora video library support"],
      ['--with-dirac', "Enables Dirac video library support"],
      ['--with-shout', "Enables Icecast and Shoutcast  streaming library support"],
      ['--with-mp3', "**** (only 64 bit) **** \n\tEnables Lame MP3 library support"],
    ].sort
  end

  def install
    args = [
            "--with-user="+Etc.getlogin,
            "--with-group="+Etc.getgrgid(Process.egid).name,
            "--with-default-font=/Library/Fonts/Verdana.ttf",
            "--disable-ldconf",
           ]

    rev = self.version.to_s + '-macosx-snow-leopard' if MacOS.snow_leopard?
    rev = self.version.to_s + '-macosx-lion' if MacOS.lion?
    rev = self.version.to_s + '-macosx-mountain-lion' if MacOS.mountain_lion?

    ENV.append 'MAKEFLAGS', "-j2"
    ENV.append 'OCAMLPATH', "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append 'OCAMLFIND_DESTDIR', "#{lib}/ocaml/site-lib"
    inreplace "configure", "dummy text2wave", "dummy text2wave.sh" if speech?
    inreplace "configure", self.version, rev
    system './configure', "--prefix=#{prefix}", *args
    system 'make'
    system 'make', 'doc' if build_doc?
    remove_file 'INSTALL'
    mkdir_p "#{var}/log/liquidsoap" unless File.directory? "#{var}/log/liquidsoap"
    mkdir_p "#{var}/run/liquidsoap" unless File.directory? "#{var}/run/liquidsoap"
    system 'make', 'install'
  end

  def caveats
    s = ""
    unless Hardware.is_64_bit?
      s += <<-EOS.undent
        * MP3 (Lame) Output support only available if CPU x86_64

      EOS
    end
    s += <<-EOS.undent
        * There are no PulseAudio support
                Reason: Build Failure (https://github.com/mxcl/homebrew/pull/9226)

    EOS
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
