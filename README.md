# Homebrew-Liquidsoap

[Homebrew][homebrewhome] Liquidsoap formula repository (**MacOSX only**)

## Requirements

* [Homebrew][homebrew]
* [Snow Leopard or Lion][apple] - Untested against [Mountain Lion][mountainlion] (Unknown)
* [Intel x86 and x64 processor][intel] (does not compile on [PowerPC][ppc] or [other old mac's][oldmacs])

## Installation

### Quick Start

`brew tap drfill/liquidsoap`

### Installing homebrew-liquidsoap Formulae

`brew install liquidsoap`

### Options available in homebrew-liquidsoap formula

	--with-samplerate
		Enables Samplerate library support

	--with-xmlplaylist
		Enables XmlPlaylist support

	--with-lastfm
		Enables LAST.fm support

	--with-soundtouch
		Enables Soundtouch library support

	--with-aac
		Enables AAC library support

	--with-aacplus
		Enables AAC+ library support

	--with-lo
		Enables lo library support

	--with-video-processing
		Enables video processing modules (currently in development)

## Usage

`liquidsoap --help` or [documentation page][docs] at [liquidsoap.fm](http://liquidsoap.fm)

## Todo

* libpng support in camlimages (MacOSX native pnglib has no support)
* GD
* DSSI
* LADSPA
* Various Sound Daemons like ALSA/Portaudio/Pulseaudio/JACK/GStreamer

## Bugs and other caveats

1. Lame library compiled in only if CPU x64

## License

			GNU GENERAL PUBLIC LICENSE
				Version 2, June 1991
			
	Copyright (C) 1989, 1991 Free Software Foundation, Inc.
	59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
	Everyone is permitted to copy and distribute verbatim copies
	of this license document, but changing it is not allowed.

full on http://savonet.hg.sourceforge.net/hgweb/savonet/savonet/raw-file/6e8a95e78fba/LICENSE


[homebrewhome]:http://mxcl.github.com/homebrew/
[homebrew]:https://github.com/mxcl/homebrew/wiki/installation
[mountainlion]:http://www.apple.com/macosx/mountain-lion/
[apple]:http://apple.com
[intel]:http://intel.com
[ppc]:https://www-01.ibm.com/chips/techlib/techlib.nsf/products/PowerPC
[oldmacs]:http://myoldmac.net/cgi-data/gal/index.php
[docs]:http://liquidsoap.fm/doc-1.0.0/documentation.html