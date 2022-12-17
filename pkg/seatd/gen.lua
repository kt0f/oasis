cflags{
	'-std=c11',
	'-I $srcdir/include',
	'-D BUILTIN_ENABLED=1',
	'-D LIBSEAT=1',
	'-D_FILE_OFFSET_BITS=64',
	'-D_XOPEN_SOURCE=700',
	'-D__BSD_VISIBLE',
	'-D_NETBSD_SOURCE',
	'-DSEATD_VERSION=\\"0.7.0\\"',
	'-DSEATD_DEFAULTPATH=\\"/run/seatd.sock\\"',
}

pkg.deps = {
}

pkg.hdrs = {
	copy('$outdir/include', '$srcdir/include', {'libseat.h'}),
}

pkg.hdrs.install = true

lib('libseat.a', [[
	common/log.c
	common/linked_list.c
	common/terminal.c
	common/connection.c
	common/evdev.c
	common/drm.c
	common/wscons.c
	seatd/poller.c
	seatd/seat.c
	seatd/client.c
	seatd/server.c
	libseat/libseat.c
	libseat/backend/noop.c
	libseat/backend/seatd.c
]])
