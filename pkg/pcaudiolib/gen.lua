cflags{
	'-D HAVE_CONFIG_H',
	'-I $dir',
	'-I $srcdir/src',
        '-isystem $srcdir/src/include',
        '-isystem $builddir/pkg/alsa-lib/include',
}

pkg.hdrs = {
	copy('$outdir/include', '$srcdir/src/include/', {'pcaudiolib/audio.h'}),
}
pkg.deps = {'pkg/alsa-lib/headers'}

lib('libpcaudio.a', [[
	src/alsa.c
	src/qsa.c
	src/oss.c
	src/pulseaudio.c
	src/audio.c
]])
file('lib/libpcaudio.a', '644', '$outdir/libpcaudio.a')

fetch 'git'
