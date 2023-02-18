cflags{
	'-std=c11',
	'-DPKG_CONFIG_PREFIX=\\"/\\"',
	'-DPKG_CONFIG_PATH=\\"/lib/pkgconfig\\"',
}

pkg.deps = {}

pkg.hdrs = {}

exe('pkg-config', 'generic_main.c')

file('bin/pkg-config', '755', '$outdir/pkg-config')

fetch 'git'
