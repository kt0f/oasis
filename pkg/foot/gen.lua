cflags{
	'-I $dir',
	'-I $outdir',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/freetype/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/linux-headers/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
	'-isystem $builddir/pkg/tllist/include',
	'-isystem $builddir/pkg/fcft/include',
	'-D FOOT_IME_ENABLED=1',
	'-D FOOT_DEFAULT_TERM=\\"foot\\"',
	'-D FOOT_DEFAULT_UTEMPTER_PATH=\\"\\"',
	'-pthread',
}

pkg.deps = {
	'pkg/fontconfig/headers',
	'pkg/freetype/headers',
	'pkg/libxkbcommon/headers',
	'pkg/linux-headers/headers',
	'pkg/pixman/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
	'pkg/tllist/headers',
	'pkg/fcft/headers',
	'$outdir/presentation-time.h',
	'$outdir/primary-selection-unstable-v1.h',
	'$outdir/text-input-unstable-v3.h',
	'$srcdir/text-input-unstable-v3.h',
	'$outdir/xdg-decoration-unstable-v1.h',
	'$outdir/xdg-output-unstable-v1.h',
	'$outdir/xdg-shell.h',
}

build('copy', '$outdir/presentation-time.h', '$builddir/pkg/wayland-protocols/include/presentation-time-client-protocol.h')
build('copy', '$outdir/primary-selection-unstable-v1.h', '$builddir/pkg/wayland-protocols/include/primary-selection-unstable-v1-client-protocol.h')
build('copy', '$outdir/text-input-unstable-v3.h', '$builddir/pkg/wayland-protocols/include/text-input-unstable-v3-client-protocol.h')
build('copy', '$srcdir/text-input-unstable-v3.h', '$builddir/pkg/wayland-protocols/include/text-input-unstable-v3-client-protocol.h')
build('copy', '$outdir/xdg-decoration-unstable-v1.h', '$builddir/pkg/wayland-protocols/include/xdg-decoration-unstable-v1-client-protocol.h')
build('copy', '$outdir/xdg-output-unstable-v1.h', '$builddir/pkg/wayland-protocols/include/xdg-output-unstable-v1-client-protocol.h')
build('copy', '$outdir/xdg-shell.h', '$builddir/pkg/wayland-protocols/include/xdg-shell-client-protocol.h')

exe('foot', [[
	async.c
	base64.c
	box-drawing.c
	char32.c
	commands.c
	composed.c
	config.c
	csi.c
	dcs.c
	debug.c
	extract.c
	fdm.c
	grid.c
	hsl.c
	ime.c
	input.c
	key-binding.c
	log.c
	main.c
	misc.c
	notify.c
	osc.c
	quirks.c
	reaper.c
	render.c
	search.c
	selection.c
	server.c
	shm.c
	sixel.c
	slave.c
	spawn.c
	terminal.c
	tokenize.c
	unicode-mode.c
	uri.c
	url-mode.c
	user-notification.c
	vt.c
	wayland.c
	xmalloc.c
	xsnprintf.c
	$builddir/pkg/(
		pixman/libpixman.a.d
		fontconfig/libfontconfig.a.d
		freetype/libfreetype.a.d
		libxkbcommon/libxkbcommon.a
		wayland/libwayland-client.a.d
		wayland/libwayland-cursor.a.d
		wayland-protocols/presentation-time-protocol.c.o
		wayland-protocols/primary-selection-unstable-v1-protocol.c.o
		wayland-protocols/text-input-unstable-v3-protocol.c.o
		wayland-protocols/xdg-decoration-unstable-v1-protocol.c.o
		wayland-protocols/xdg-output-unstable-v1-protocol.c.o
		wayland-protocols/xdg-shell-protocol.c.o
		fcft/libfcft.a	
)]])

file('bin/foot', '755', '$outdir/foot')

-- man{'foot.1'}

fetch 'git'
