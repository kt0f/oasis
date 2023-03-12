cflags{
	'-I $srcdir',
}

pkg.hdrs = {
	copy('$outdir/include', '$srcdir', {'sonic.h'}),
}
pkg.deps = {}

lib('libsonic.a', [[
	sonic.c
	wave.c
]])
file('lib/libsonic.a', '644', '$outdir/libsonic.a')

fetch 'git'
