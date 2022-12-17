cflags{
	'-isystem $builddir/pkg/linux-headers/include',
}

pkg.deps = {
	'pkg/linux-headers/headers',
}

pkg.hdrs = copy('$outdir/include', '$srcdir', {'udev.h'} )
pkg.hdrs.install = true

lib('libudev.a', [[
	udev.c
	udev_device.c
	udev_enumerate.c
	udev_list.c
	udev_monitor.c	
]])

file('lib/libudev.a', '755', '$outdir/libudev.a')

fetch 'git'
