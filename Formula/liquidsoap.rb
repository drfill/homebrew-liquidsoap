require 'formula'
require 'etc'

class Liquidsoap < Formula
  # def self.gd?
  #   ARGV.include? '--with-gd' or ARGV.include? '--with-all'
  # end

  def self.samplerate?
    ARGV.include? '--with-samplerate' or ARGV.include? '--with-all'
  end

  def self.xmlm?
    ARGV.include? '--with-samplerate' or ARGV.include? '--with-all'
  end

  def self.lastfm?
    ARGV.include? '--with-lastfm' or ARGV.include? '--with-all'
  end

  def self.xmlplaylist?
    ARGV.include? '--with-xmlplaylist' or ARGV.include? '--with-all' or ARGV.include? '--with-lastfm'
  end

  def self.soundtouch?
    ARGV.include? '--with-soundtouch' or ARGV.include? '--with-all'
  end

  def self.aacplus?
    ARGV.include? '--with-aacplus' or ARGV.include? '--with-all'
  end

  def self.aac?
    ARGV.include? '--with-aac' or ARGV.include? '--with-all'
  end

  def self.fdkaac?
    ARGV.include? '--with-fdkaac' or ARGV.include? '--with-all'
  end

  def self.lo?
    ARGV.include? '--with-lo' or ARGV.include? '--with-all'
  end

  def self.video_processing?
    ARGV.include? '--with-video-processing' or ARGV.include? '--with-all'
  end

  def self.ffmpeg?
    ARGV.include? '--with-ffmpeg' or ARGV.include? '--with-all'
  end

  def self.speech?
    ARGV.include? '--with-speech' or ARGV.include? '--with-all'
  end

  def self.gstreamer?
    ARGV.include? '--with-gstreamer' or ARGV.include? '--with-all'
  end

  def self.mad?
    ARGV.include? '--with-mp3' or ARGV.include? '--with-all'
  end

  def self.mp3?
    (ARGV.include? '--with-mp3' or ARGV.include? '--with-all') and Hardware.is_64_bit?
  end

  def self.bjack?
    ARGV.include? '--with-bjack' or ARGV.include? '--with-all'
  end

  def self.ladspa?
    ARGV.include? '--with-ladspa' or ARGV.include? '--with-all'
  end

  def self.frei0r?
    ARGV.include? '--with-frei0r' or ARGV.include? '--with-all'
  end

  def self.portaudio?
    ARGV.include? '--with-portaudio' or ARGV.include? '--with-all'
  end

  def self.soundtouch?
    ARGV.include? '--with-soundtouch' or ARGV.include? '--with-all'
  end

  def self.ao?
    ARGV.include? '--with-ao' or ARGV.include? '--with-all'
  end

  def self.flac?
    ARGV.include? '--with-flac' or ARGV.include? '--with-all'
  end

  def self.opus?
      ARGV.include? '--with-opus' or ARGV.include? '--with-all'
  end

  def self.speex?
    ARGV.include? '--with-speex' or ARGV.include? '--with-all'
  end

  def self.theora?
    ARGV.include? '--with-theora' or ARGV.include? '--with-all'
  end

  def self.schroedinger?
    ARGV.include? '--with-dirac' or ARGV.include? '--with-all'
  end

  def self.cry?
    ARGV.include? '--with-shout' or ARGV.include? '--with-all'
  end

  def self.shine?
      ARGV.include? '--with-shine' or ARGV.include? '--with-all'
  end

  #def self.graphics?
  #  ARGV.include? '--enable-graphics' or video_processing?
  #end

  def self.build_doc?
    ARGV.include? '--with-doc'
  end

  def self.inc_all?
    ARGV.include? '--with-all'
  end

  url 'http://sourceforge.net/projects/savonet/files/liquidsoap/1.1.1/liquidsoap-1.1.1.tar.bz2'
  homepage 'http://liquidsoap.fm/'
  sha256 '03990cbe21dc41b0aeeda60fcaaf5c2c48707c418724fe88abc1c57a5fa15ef5'

  unless MacOS.version >= :snow_leopard
    onoe 'Sorry!'
    onoe 'We currently does not support MacOSX older than 10.6, '
    onoe 'try old Macports way described here -> http://savonet.sourceforge.net/macports.html'
    exit
  end

  depends_on 'pkg-config' => :build
  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-dtools' => :build
  depends_on 'ocaml-duppy' => :build
  depends_on 'ocaml-cry' if cry? # This package contains an OCaml low level implementation of the shout protocol.
  depends_on 'ocaml-shine' if shine?
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
  depends_on 'ocaml-opus' if opus?
  depends_on 'ocaml-faad' if aac?
  depends_on 'ocaml-fdkaac' if fdkaac?
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
  depends_on "ocaml-gavl" if video_processing?
  depends_on 'ocaml-gstreamer' if gstreamer?
  depends_on 'ocaml-ffmpeg' if ffmpeg?
  depends_on 'ocaml-portaudio' if portaudio?
  depends_on 'ocaml-bjack' if bjack?
  depends_on 'ocaml-ladspa' if ladspa?
  depends_on 'ocaml-frei0r' if frei0r?
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
      #['--disable-graphics', "Disables graphics support"],
    ].sort
  end

  def install
    args = [
            "--with-user="+Etc.getlogin,
            "--with-group="+Etc.getgrgid(Process.egid).name,
            "--with-default-font=/Library/Fonts/Verdana.ttf",
            "--disable-ldconf",
           ]
    args << "--disable-graphics" # unless graphics?

    rev = self.version.to_s + '-macosx-snow-leopard' if MacOS.snow_leopard?
    rev = self.version.to_s + '-macosx-lion' if MacOS.lion?
    rev = self.version.to_s + '-macosx-mountain-lion' if MacOS.mountain_lion?

    ENV.append 'MAKEFLAGS', "-j2"
    ENV.append 'OCAMLPATH', "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append 'OCAMLFIND_DESTDIR', "#{lib}/ocaml/site-lib"
    inreplace "configure", "dummy text2wave", "dummy text2wave.sh" if self.class.speech?
    inreplace "configure", self.version, rev
    system './configure', "--prefix=#{prefix}", *args
    system 'make'
    system 'make', 'doc' if self.class.build_doc?
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
        * There are no camlimages support
                Reason: Build Failure
    EOS
  end

  def test
    system "#{bin}/liquidsoap --version"
  end

  patch :p1, :DATA # For Bytes.create..
end
__END__
diff --git a/src/decoder/aac_decoder.ml b/src/decoder/aac_decoder.ml
index a6eff8f..f33666d 100644
--- a/src/decoder/aac_decoder.ml
+++ b/src/decoder/aac_decoder.ml
@@ -160,7 +160,7 @@ let get_type filename =
   let fd = Unix.openfile filename [Unix.O_RDONLY] 0o644 in
   let dec = Faad.create () in
   let aacbuflen = 1024 in
-  let aacbuf = String.create aacbuflen in
+  let aacbuf = Bytes.to_string (Bytes.create aacbuflen) in
     Tutils.finalize ~k:(fun () -> Unix.close fd)
       (fun () ->
          let _,rate,channels =
diff --git a/src/decoder/decoder.ml b/src/decoder/decoder.ml
index fab956d..5267dc0 100644
--- a/src/decoder/decoder.ml
+++ b/src/decoder/decoder.ml
@@ -326,7 +326,7 @@ struct
     let proc_bytes = ref 0 in
     let read len =
       try
-        let s = String.create len in
+        let s = Bytes.to_string (Bytes.create len) in
         let i = Unix.read fd s 0 len in
         proc_bytes := !proc_bytes + i;
           s, i
diff --git a/src/decoder/external_decoder.ml b/src/decoder/external_decoder.ml
index 586c13e..e208b5a 100644
--- a/src/decoder/external_decoder.ml
+++ b/src/decoder/external_decoder.ml
@@ -115,7 +115,7 @@ let external_input process input =
          (fun inlen ->
            Tutils.mutexify task_m (fun () ->
              if !is_task then
-               let tmpbuf = String.create inlen in
+               let tmpbuf = Bytes.to_string (Bytes.create inlen) in
                let read = Unix.read pull_e tmpbuf 0 inlen in
                tmpbuf, read
               else
@@ -252,7 +252,7 @@ let external_input_oblivious process filename prebuf =
   in
   let read len =
     if not !process_done then
-      let ret = String.create len in
+      let ret = Bytes.to_string (Bytes.create len) in
       let read = Unix.read pull_e ret 0 len in
       if read = 0 then close () ;
       ret,read
diff --git a/src/decoder/image/ppm_decoder.ml b/src/decoder/image/ppm_decoder.ml
index 720b5c1..39830ad 100644
--- a/src/decoder/image/ppm_decoder.ml
+++ b/src/decoder/image/ppm_decoder.ml
@@ -27,7 +27,7 @@ let log = Dtools.Log.make ["decoder";"ppm"]
 let load_image fname =
   let ic = open_in_bin fname in
   let len = in_channel_length ic in
-  let data = String.create len in
+  let data = Bytes.to_string (Bytes.create len) in
   really_input ic data 0 len;
   close_in ic;
   Img.of_PPM data
diff --git a/src/encoder/external_encoder.ml b/src/encoder/external_encoder.ml
index af195d1..cb648e4 100644
--- a/src/encoder/external_encoder.ml
+++ b/src/encoder/external_encoder.ml
@@ -122,7 +122,7 @@ let encoder id ext =
         output_string out_e header
       end;
     let sock = Unix.descr_of_in_channel in_e in
-    let buf = String.create 10000 in
+    let buf = Bytes.to_string (Bytes.create 10000) in
     let events = [`Read sock]
     in
     let rec pull _ =
@@ -208,7 +208,7 @@ let encoder id ext =
         b,0,Array.length b.(0)
     in
     let slen = 2 * len * Array.length b in
-    let sbuf = String.create slen in
+    let sbuf = Bytes.to_string (Bytes.create slen) in
     Audio.S16LE.of_audio b start sbuf 0 len;
     (** Wait for any possible creation.. *)
     begin
diff --git a/src/encoder/gstreamer_encoder.ml b/src/encoder/gstreamer_encoder.ml
index 55e752b..213f437 100644
--- a/src/encoder/gstreamer_encoder.ml
+++ b/src/encoder/gstreamer_encoder.ml
@@ -175,7 +175,7 @@ let encoder id ext =
       let astart = Frame.audio_of_master start in
       let alen = Frame.audio_of_master len in
       let pcm = content.Frame.audio in
-      let data = String.create (2*channels*alen) in
+      let data = Bytes.to_string (Bytes.create (2*channels*alen)) in
       Audio.S16LE.of_audio pcm astart data 0 alen;
       let gstbuf = Gstreamer.Buffer.of_string data 0 (String.length data) in
       Gstreamer.Buffer.set_presentation_time gstbuf !now;
diff --git a/src/encoder/wav_encoder.ml b/src/encoder/wav_encoder.ml
index e0304d4..d24ac91 100644
--- a/src/encoder/wav_encoder.ml
+++ b/src/encoder/wav_encoder.ml
@@ -61,7 +61,7 @@ let encoder wav =
         in
         b,0,Array.length b.(0)
     in
-    let s = String.create (sample_size / 8 * len * channels) in
+    let s = Bytes.to_string (Bytes.create (sample_size / 8 * len * channels)) in
     begin match sample_size with
       | 16 -> Audio.S16LE.of_audio b start s 0 len
       | 8 -> Audio.U8.of_audio b start s 0 len
diff --git a/src/io/alsa_io.ml b/src/io/alsa_io.ml
index 7c0fd96..7398e70 100644
--- a/src/io/alsa_io.ml
+++ b/src/io/alsa_io.ml
@@ -75,13 +75,13 @@ object (self)
                     Pcm.set_access dev params Pcm.Access_rw_interleaved;
                     write <-
                     (fun pcm buf ofs len ->
-                       let sbuf = String.create (2 * len * Array.length buf) in
+                       let sbuf = Bytes.to_string (Bytes.create (2 * len * Array.length buf)) in
                        Audio.S16LE.of_audio buf ofs sbuf 0 len;
                        Pcm.writei pcm sbuf 0 len
                     );
                     read <-
                     (fun pcm buf ofs len ->
-                       let sbuf = String.create (2 * 2 * len) in
+                       let sbuf = Bytes.to_string (Bytes.create (2 * 2 * len)) in
                        let r = Pcm.readi pcm sbuf 0 len in
                        Audio.S16LE.to_audio sbuf 0 buf ofs r;
                        r
@@ -97,7 +97,7 @@ object (self)
                            let sbuf =
                              Array.init
                                channels
-                               (fun _ -> String.create (2 * len))
+                               (fun _ -> Bytes.to_string (Bytes.create (2 * len))
                            in
                            for c = 0 to Audio.channels buf - 1 do
                              Audio.S16LE.of_audio
@@ -110,7 +110,7 @@ object (self)
                            let sbuf =
                              Array.init
                                channels
-                               (fun _ -> String.create (2 * len))
+                               (fun _ -> Bytes.to_string (Bytes.create (2 * len))
                            in
                            let r = Pcm.readn pcm sbuf 0 len in
                            for c = 0 to Audio.channels buf - 1 do
diff --git a/src/io/gstreamer_io.ml b/src/io/gstreamer_io.ml
index fb959af..ebb2d33 100644
--- a/src/io/gstreamer_io.ml
+++ b/src/io/gstreamer_io.ml
@@ -141,7 +141,7 @@ object (self)
           let pcm = content.Frame.audio in
           assert (Array.length pcm = channels);
           let len = Frame.audio_of_master len in
-          let data = String.create (2*channels*len) in
+          let data = Bytes.to_string (Bytes.create (2*channels*len)) in
           Audio.S16LE.of_audio pcm 0 data 0 len;
           let gstbuf = Gstreamer.Buffer.of_string data 0 (String.length data) in
           Gstreamer.Buffer.set_presentation_time gstbuf now;
@@ -345,7 +345,7 @@ object (self)
       let pcm = content.Frame.audio in
       assert (Array.length pcm = channels);
       let len = Frame.audio_of_master len in
-      let data = String.create (2*channels*len) in
+      let data = Bytes.to_string (Bytes.create (2*channels*len)) in
       Audio.S16LE.of_audio pcm 0 data 0 len;
       Tutils.mutexify audio_buffer_mutex (fun () ->
         Queue.push data audio_buffer;
diff --git a/src/io/oss_io.ml b/src/io/oss_io.ml
index 1874be5..040b147 100644
--- a/src/io/oss_io.ml
+++ b/src/io/oss_io.ml
@@ -89,7 +89,7 @@ object (self)
     let fd = Utils.get_some fd in
     let buf = AFrame.content memo 0 in
     let r = Audio.S16LE.length (Audio.channels buf) (Audio.duration buf) in
-    let s = String.create r in
+    let s = Bytes.to_string (Bytes.create r) in
     Audio.S16LE.of_audio buf 0 s 0 (Audio.duration buf);
     let w = Unix.write fd s 0 r in
     assert (w = r)
@@ -146,7 +146,7 @@ object (self)
     let fd = Utils.get_some fd in
     let buf = AFrame.content_of_type ~channels frame 0 in
     let len = 2 * (Array.length buf) * (Array.length buf.(0)) in
-    let s = String.create len in
+    let s = Bytes.to_string (Bytes.create len) in
     let r = Unix.read fd s 0 len in
       (* TODO: recursive read ? *)
       assert (len = r) ;
diff --git a/src/io/udp_io.ml b/src/io/udp_io.ml
index 483f367..a526f76 100644
--- a/src/io/udp_io.ml
+++ b/src/io/udp_io.ml
@@ -131,7 +131,7 @@ object (self)
       (* Read data from the network. *)
       let read len =
         wait () ;
-        let msg = String.create len in
+        let msg = Bytes.to_string (Bytes.create len) in
         let n,_ = Unix.recvfrom socket msg 0 len [] in
           msg,n
       in
diff --git a/src/outputs/alsa_out.ml b/src/outputs/alsa_out.ml
index 50ed564..0f9df99 100644
--- a/src/outputs/alsa_out.ml
+++ b/src/outputs/alsa_out.ml
@@ -88,7 +88,7 @@ object (self)
                     Pcm.set_format dev params Pcm.Format_s16_le ;
                     alsa_write <-
                       (fun pcm buf ofs len ->
-                         let sbuf = String.create (2 * len * Array.length buf) in
+                         let sbuf = Bytes.to_string (Bytes.create (2 * len * Array.length buf)) in
                          Audio.S16LE.of_audio buf ofs sbuf 0 len;
                          Pcm.writei pcm sbuf 0 len
                       )
diff --git a/src/protocols/mpd.ml b/src/protocols/mpd.ml
index e6b1aba..e2ecc73 100644
--- a/src/protocols/mpd.ml
+++ b/src/protocols/mpd.ml
@@ -58,7 +58,7 @@ let connect () =
   let socket = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in
   let read () =
     let buflen = 1024 in
-    let buf = String.create buflen in
+    let buf = Bytes.to_string (Bytes.create buflen) in
     let ans = ref "" in
     let n = ref buflen in
       while !n = buflen do
diff --git a/src/sources/alsa_in.ml b/src/sources/alsa_in.ml
index e689528..24e1bb3 100644
--- a/src/sources/alsa_in.ml
+++ b/src/sources/alsa_in.ml
@@ -93,7 +93,7 @@ object (self)
                 Pcm.set_format dev params Pcm.Format_s16_le ;
                 read_fun <-
                   (fun pcm buf ofs len ->
-                     let sbuf = String.create (2 * 2 * len) in
+                     let sbuf = Bytes.to_string (Bytes.create (2 * 2 * len)) in
                      let r = Pcm.readi pcm sbuf 0 len in
                      Audio.S16LE.to_audio sbuf 0 buf ofs r;
                      r)
diff --git a/src/sources/external_input.ml b/src/sources/external_input.ml
index b4d66f6..475e5ce 100644
--- a/src/sources/external_input.ml
+++ b/src/sources/external_input.ml
@@ -59,7 +59,7 @@ object (self)
       in_e,Unix.descr_of_in_channel in_e
     in
     let (in_e,in_d) as x = create () in
-    let tmpbuf = String.create 1024 in
+    let tmpbuf = Bytes.to_string (Bytes.create 1024) in
     let rec process ((in_e,in_d) as x) l =
       let get_data () =
         let ret = input in_e tmpbuf 0 1024 in
diff --git a/src/sources/http_source.ml b/src/sources/http_source.ml
index 8d954e6..b362714 100644
--- a/src/sources/http_source.ml
+++ b/src/sources/http_source.ml
@@ -46,7 +46,7 @@ let read_metadata () = let old_chunk = ref "" in fun socket ->
   in
   let size = 16*size in
   let chunk =
-    let buf = String.create size in
+    let buf = Bytes.to_string (Bytes.create size) in
     let rec read pos =
       if pos=size then buf else
         let p = Unix.read socket buf pos (size-pos) in
@@ -84,7 +84,7 @@ let read_metadata () = let old_chunk = ref "" in fun socket ->

 let read_line socket =
   let ans = ref "" in
-  let c = String.create 1 in
+  let c = Bytes.to_string (Bytes.create 1) in
     if Unix.read socket c 0 1 <> 1 then raise Read_error ;
     while c <> "\n" do
       ans := !ans ^ c;
@@ -97,7 +97,7 @@ let read_chunk socket =
   let n = Scanf.sscanf n "%x" (fun n -> n) in
   let ans = ref "" in
     while String.length !ans <> n do
-      let buf = String.create (n - String.length !ans) in
+      let buf = Bytes.to_string (Bytes.create (n - String.length !ans)) in
       let r = Unix.read socket buf 0 (n - String.length !ans) in
         ans := !ans ^ (String.sub buf 0 r)
     done;
@@ -119,14 +119,14 @@ let read_stream socket chunked metaint insert_metadata =
     match metaint with
       | None ->
           fun len ->
-            let b = String.create len in
+            let b = Bytes.to_string (Bytes.create len) in
             let r = read b 0 len in
               if r < 0 then "",0 else b,r
       | Some metaint ->
           let readcnt = ref 0 in
             fun len ->
               let len = min len (metaint - !readcnt) in
-              let b = String.create len in
+              let b = Bytes.to_string (Bytes.create len) in
               let r = read b 0 len in
                 if r < 0 then "",0 else begin
                   readcnt := !readcnt + r;
diff --git a/src/stream/aFrame.ml b/src/stream/aFrame.ml
index 0c78926..1f2062b 100644
--- a/src/stream/aFrame.ml
+++ b/src/stream/aFrame.ml
@@ -44,7 +44,7 @@ let to_s16le b =
   assert (Audio.channels fpcm = 2);
   (*
   let slen = 2 * Array.length fpcm * Array.length fpcm.(0) in
-  let s = String.create slen in
+  let s = Bytes.to_string (Bytes.create slen) in
     assert (Audio.to_16le fpcm 0 (Array.length fpcm.(0)) s 0 = slen);
     s
   *)
diff --git a/src/synth/keyboard.ml b/src/synth/keyboard.ml
index 4dee990..67cdee2 100644
--- a/src/synth/keyboard.ml
+++ b/src/synth/keyboard.ml
@@ -74,7 +74,7 @@ object (self)
       let rec task _ =
         if run_id <> id then [] else
           let c =
-            let c = String.create 1 in
+            let c = Bytes.to_string (Bytes.create 1) in
               ignore (Unix.read Unix.stdin c 0 1);
               c.[0]
           in
diff --git a/src/tools/http.ml b/src/tools/http.ml
index 89e4fe1..f10edf0 100644
--- a/src/tools/http.ml
+++ b/src/tools/http.ml
@@ -35,7 +35,7 @@ let to_hex2 =
        '8'; '9'; 'A'; 'B'; 'C'; 'D'; 'E'; 'F' |]
   in
     fun k ->
-      let s = String.create 2 in
+      let s = Bytes.to_string (Bytes.create 2) in
         s.[0] <- hex_digits.( (k lsr 4) land 15 ) ;
         s.[1] <- hex_digits.( k land 15 ) ;
         s
@@ -189,12 +189,12 @@ let read ?(log=fun _ -> ()) ~timeout socket buflen =
   Tutils.wait_for ~log `Read socket timeout;
   match buflen with
     | Some buflen ->
-        let buf = String.create buflen in
+        let buf = Bytes.to_string (Bytes.create buflen) in
         let n = Unix.recv socket buf 0 buflen [] in
           String.sub buf 0 n
     | None ->
         let buflen = 1024 in
-        let buf = String.create buflen in
+        let buf = Bytes.to_string (Bytes.create buflen) in
         let ans = ref "" in
         let n = ref buflen in
           while !n <> 0 do
@@ -214,7 +214,7 @@ let read_crlf ?(log=fun _ -> ()) ?(max=4096) ~timeout socket =
   let n = ref 0 in
   let loop = ref true in
   let was_n = ref false in
-  let c = String.create 1 in
+  let c = Bytes.to_string (Bytes.create 1) in
     (* We need to parse char by char because
      * we want to make sure we stop at the exact
      * end of [\r]?\n[\r]?\n in order to pass a socket
diff --git a/src/tools/tutils.ml b/src/tools/tutils.ml
index 0798bb6..90523c2 100644
--- a/src/tools/tutils.ml
+++ b/src/tools/tutils.ml
@@ -261,7 +261,7 @@ let start_forwarding () =
          handler  = f }
     in
     let len = 1024 in
-    let buffer = String.create len in
+    let buffer = Bytes.to_string (Bytes.create len) in
     let rec f (acc:string list) _ =
       let n = Unix.read fd buffer 0 len in
       let rec split acc i =
diff --git a/src/tools/utils.ml b/src/tools/utils.ml
index 08fd373..4f2b67b 100644
--- a/src/tools/utils.ml
+++ b/src/tools/utils.ml
@@ -193,7 +193,7 @@ let really_read fd buf ofs len =
 let read_all filename =
   let channel = open_in filename in
   let buflen = 1024 in
-  let tmp = String.create 1024 in
+  let tmp = Bytes.to_string (Bytes.create 1024) in
   let contents = Buffer.create buflen in
   let rec read () =
     let ret = input channel tmp 0 1024 in
@@ -543,7 +543,7 @@ let encode64 s =
   let extra = String.length s mod 3 in
   let s = match extra with 1 -> s ^ "\000\000" | 2 -> s ^ "\000" | _ -> s in
   let n = String.length s in
-  let dst = String.create (4 * (n/3)) in
+  let dst = Bytes.to_string (Bytes.create (4 * (n/3))) in
     for i = 0 to n/3 - 1 do
       let (:=) j v = dst.[i*4+j] <- digit.[v] in
       let c j = int_of_char s.[i*3+j] in
diff --git a/src/tools/wav.ml b/src/tools/wav.ml
index 16e745c..f53718d 100644
--- a/src/tools/wav.ml
+++ b/src/tools/wav.ml
@@ -79,7 +79,7 @@ let read_header read_ops ic =
     read_int_num_bytes ic 2
   in
   let read_string ic n =
-    let ans = String.create n in
+    let ans = Bytes.to_string (Bytes.create n) in
     really_input ic ans 0 n;
     ans
   in
@@ -187,7 +187,7 @@ let short_string i =
     (String.make 1 (char_of_int up))

 let int_string n =
-  let s = String.create 4 in
+  let s = Bytes.to_string (Bytes.create 4) in
     s.[0] <- char_of_int (n land 0xff) ;
     s.[1] <- char_of_int ((n land 0xff00) lsr 8) ;
     s.[2] <- char_of_int ((n land 0xff0000) lsr 16) ;
