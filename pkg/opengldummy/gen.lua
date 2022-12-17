cflags{
	'-I $srcdir/include',
	'-isystem $builddir/pkg/linux-headers/include',
        '-D EGL_NO_X11=1',
}

set('ldflags', {
        '$ldflags',
        '-shared',
})

pkg.deps = {
	'pkg/linux-headers/headers',
}

pkg.hdrs = {
	copy('$outdir/include/EGL', '$srcdir/include/EGL', {'egl.h', 'eglext.h', 'eglplatform.h'}),
	copy('$outdir/include/GLES2', '$srcdir/include/GLES2', {'gl2.h', 'gl2ext.h', 'gl2platform.h'}),
	copy('$outdir/include/KHR', '$srcdir/include/KHR', {'khrplatform.h'}),
}

pkg.hdrs.install = true

exe('libEGL.so', [[egl.c]])
exe('libGLESv2.so', [[gles2.c]])

file('lib/libEGL.so', '644', '$outdir/libEGL.so')
file('lib/libGLESv2.so', '644', '$outdir/libGLESv2.so')

