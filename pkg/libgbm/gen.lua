cflags{
	'-fPIC',
	'-I $srcdir',
        '-isystem $outdir',
	'-D MODULEDIR=\\"\\"',
}

set('ldflags', {
        '$ldflags',
        '-shared',
})

pkg.deps = {
        'pkg/libudev-zero/headers',
	'$outdir/libudev.h',
}

pkg.hdrs = {
	copy('$outdir/include', '$srcdir', {'gbm.h'}),
}

build('copy', '$outdir/libudev.h', '$builddir/pkg/libudev-zero/include/udev.h')

pkg.hdrs.install = true

exe('libgbm.so', [[
	gbm.c
	backend.c
	common.c
]])

file('lib/libgbm.so', '644', '$outdir/libgbm.so')
