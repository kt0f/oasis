cflags{'-isystem $builddir/pkg/wayland/include'}


waylandproto('staging/drm-lease/drm-lease-v1.xml', {
        server='include/drm-lease-v1-protocol.h',
        code='drm-lease-v1-protocol.c',
})

waylandproto('staging/ext-idle-notify/ext-idle-notify-v1.xml', {
        server='include/ext-idle-notify-v1-protocol.h',
        code='ext-idle-notify-v1-protocol.c',
})

waylandproto('staging/ext-session-lock/ext-session-lock-v1.xml', {
        server='include/ext-session-lock-v1-protocol.h',
        code='ext-session-lock-v1-protocol.c',
})

waylandproto('unstable/fullscreen-shell/fullscreen-shell-unstable-v1.xml', {
        server='include/fullscreen-shell-unstable-v1-protocol.h',
        code='fullscreen-shell-unstable-v1-protocol.c',
})

waylandproto('unstable/keyboard-shortcuts-inhibit/keyboard-shortcuts-inhibit-unstable-v1.xml', {
        client='include/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h',
        server='include/keyboard-shortcuts-inhibit-unstable-v1-protocol.h',
        code='keyboard-shortcuts-inhibit-unstable-v1-protocol.c',
})

waylandproto('unstable/pointer-constraints/pointer-constraints-unstable-v1.xml', {
        client='include/pointer-constraints-unstable-v1-client-protocol.h',
        server='include/pointer-constraints-unstable-v1-protocol.h',
        code='pointer-constraints-unstable-v1-protocol.c',
})

waylandproto('unstable/pointer-gestures/pointer-gestures-unstable-v1.xml', {
        client='include/pointer-gestures-unstable-v1-client-protocol.h',
        server='include/pointer-gestures-unstable-v1-protocol.h',
        code='pointer-gestures-unstable-v1-protocol.c',
})

waylandproto('stable/presentation-time/presentation-time.xml', {
	client='include/presentation-time-client-protocol.h',
	server='include/presentation-time-protocol.h',
	code='presentation-time-protocol.c',
})

waylandproto('unstable/relative-pointer/relative-pointer-unstable-v1.xml', {
        client='include/relative-pointer-unstable-v1-client-protocol.h',
        server='include/relative-pointer-unstable-v1-protocol.h',
        code='relative-pointer-unstable-v1-protocol.c',
})

waylandproto('staging/single-pixel-buffer/single-pixel-buffer-v1.xml', {
        client='include/single-pixel-buffer-v1-client-protocol.h',
        server='include/single-pixel-buffer-v1-protocol.h',
        code='single-pixel-buffer-v1-protocol.c',
})

waylandproto('unstable/tablet/tablet-unstable-v2.xml', {
        client='include/tablet-unstable-v2-client-protocol.h',
        server='include/tablet-unstable-v2-protocol.h',
        code='tablet-unstable-v2-protocol.c',
})

waylandproto('stable/viewporter/viewporter.xml', {
        client='include/viewporter-client-protocol.h',
        server='include/viewporter-protocol.h',
        code='viewporter-protocol.c',
})

waylandproto('staging/xdg-activation/xdg-activation-v1.xml', {
        client='include/xdg-activation-v1-client-protocol.h',
        server='include/xdg-activation-v1-protocol.h',
        code='xdg-activation-v1-protocol.c',
})

waylandproto('unstable/xdg-foreign/xdg-foreign-unstable-v2.xml ', {
        client='include/xdg-foreign-unstable-v2-client-protocol.h',
        server='include/xdg-foreign-unstable-v2-protocol.h',
        code='xdg-foreign-unstable-v2-protocol.c',
})



waylandproto('stable/xdg-shell/xdg-shell.xml', {
	client='include/xdg-shell-client-protocol.h',
	server='include/xdg-shell-server-protocol.h',
	code='xdg-shell-protocol.c',
})

waylandproto('unstable/idle-inhibit/idle-inhibit-unstable-v1.xml', {
	client='include/idle-inhibit-unstable-v1-client-protocol.h',
	server='include/idle-inhibit-unstable-v1-server-protocol.h',
	code='idle-inhibit-unstable-v1-protocol.c'
})

waylandproto('unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml', {
	client='include/linux-dmabuf-unstable-v1-client-protocol.h',
	server='include/linux-dmabuf-unstable-v1-server-protocol.h',
	code='linux-dmabuf-unstable-v1-protocol.c',
})

waylandproto('unstable/xdg-decoration/xdg-decoration-unstable-v1.xml', {
	client='include/xdg-decoration-unstable-v1-client-protocol.h',
	server='include/xdg-decoration-unstable-v1-server-protocol.h',
	code='xdg-decoration-unstable-v1-protocol.c',
})

waylandproto('unstable/xdg-output/xdg-output-unstable-v1.xml', {
	client='include/xdg-output-unstable-v1-client-protocol.h',
	server='include/xdg-output-unstable-v1-server-protocol.h',
	code='xdg-output-unstable-v1-protocol.c',
})

waylandproto('unstable/text-input/text-input-unstable-v3.xml', {
	client='include/text-input-unstable-v3-client-protocol.h',
	server='include/text-input-unstable-v3-server-protocol.h',
	code='text-input-unstable-v3-protocol.c',
})


waylandproto('unstable/primary-selection/primary-selection-unstable-v1.xml', {
        client='include/primary-selection-unstable-v1-client-protocol.h',
        server='include/primary-selection-unstable-v1-server-protocol.h',
        code='primary-selection-unstable-v1-protocol.c',
})

pkg.hdrs = {
	'$outdir/include/drm-lease-v1-protocol.h',
	'$outdir/include/ext-session-lock-v1-protocol.h',
	'$outdir/include/ext-idle-notify-v1-protocol.h',
	'$outdir/include/fullscreen-shell-unstable-v1-protocol.h',
	'$outdir/include/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h',
	'$outdir/include/keyboard-shortcuts-inhibit-unstable-v1-protocol.h',
	'$outdir/include/pointer-constraints-unstable-v1-client-protocol.h',
	'$outdir/include/pointer-constraints-unstable-v1-protocol.h',
	'$outdir/include/pointer-gestures-unstable-v1-client-protocol.h',
	'$outdir/include/pointer-gestures-unstable-v1-protocol.h',
	'$outdir/include/presentation-time-client-protocol.h',
	'$outdir/include/presentation-time-protocol.h',
	'$outdir/include/relative-pointer-unstable-v1-client-protocol.h',
	'$outdir/include/relative-pointer-unstable-v1-protocol.h',
	'$outdir/include/single-pixel-buffer-v1-client-protocol.h',
	'$outdir/include/single-pixel-buffer-v1-protocol.h',
	'$outdir/include/tablet-unstable-v2-client-protocol.h',
	'$outdir/include/tablet-unstable-v2-protocol.h',
	'$outdir/include/viewporter-client-protocol.h',
	'$outdir/include/viewporter-protocol.h',
	'$outdir/include/xdg-activation-v1-client-protocol.h',
	'$outdir/include/xdg-activation-v1-protocol.h',
	'$outdir/include/xdg-foreign-unstable-v2-client-protocol.h',
	'$outdir/include/xdg-foreign-unstable-v2-protocol.h',
	'$outdir/include/presentation-time-client-protocol.h',
	'$outdir/include/xdg-shell-client-protocol.h',
	'$outdir/include/xdg-shell-server-protocol.h',
	'$outdir/include/idle-inhibit-unstable-v1-client-protocol.h',
	'$outdir/include/idle-inhibit-unstable-v1-server-protocol.h',
	'$outdir/include/linux-dmabuf-unstable-v1-client-protocol.h',
	'$outdir/include/linux-dmabuf-unstable-v1-server-protocol.h',
	'$outdir/include/xdg-decoration-unstable-v1-client-protocol.h',
	'$outdir/include/xdg-decoration-unstable-v1-server-protocol.h',
	'$outdir/include/xdg-output-unstable-v1-client-protocol.h',
	'$outdir/include/xdg-output-unstable-v1-server-protocol.h',
	'$outdir/include/text-input-unstable-v3-client-protocol.h',
	'$outdir/include/text-input-unstable-v3-server-protocol.h',
	'$outdir/include/primary-selection-unstable-v1-client-protocol.h',
	'$outdir/include/primary-selection-unstable-v1-server-protocol.h',
}

fetch 'git'
