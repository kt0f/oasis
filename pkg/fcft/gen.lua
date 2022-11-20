cflags{
	'-I $outdir',
	'-I $srcdir',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/freetype/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/tllist/include',
	'-DMEMFD_CREATE',
	'-DFCFT_EXPORT='
}

pkg.hdrs = copy('$outdir/include/fcft', '$srcdir/fcft', {'fcft.h', 'stride.h'})
pkg.hdrs.install = true

local srcs = {
	'fcft.c',
	'log.c',
}

local libs = {
	'fontconfig/libfontconfig.a.d',
	'freetype/libfreetype.a.d',
	'pixman/libpixman.a',
}

pkg.deps = {
	'pkg/fontconfig/headers',
	'pkg/freetype/headers',
	'pkg/pixman/headers',
	'pkg/tllist/headers',
}

lib('libfcft.a', {srcs, expand{'$builddir/pkg/', libs}})

fetch 'git'
