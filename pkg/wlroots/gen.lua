cflags{
	'-I $builddir/pkg/wayland-protocols/include',
	'-I $dir',
	'-I $dir/shaders',
	'-I $outdir',
	'-I $srcdir/include',
	'-isystem $builddir/pkg/libgbm/include',
	'-isystem $builddir/pkg/libinput/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/libdrm/include',
	'-isystem $builddir/pkg/libudev-zero/include',
	'-isystem $builddir/pkg/opengldummy/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/seatd/include',
	'-isystem $builddir/pkg/wayland/include',
	'-D EGL_NO_X11=1',
	'-D isfinite=__builtin_isfinite',
	'-D WLR_HAS_DRM_BACKEND=1',
	'-D WLR_HAS_LIBINPUT_BACKEND=1',
	'-D WLR_HAS_GLES2_RENDERER=1',
	'-D WLR_USE_UNSTABLE=1',
	'-D NAN=0',
	'-pthread',
}

set('ldflags', {
	'-L$builddir/pkg/opengldummy/',
	'-L$builddir/pkg/libgbm/',
	'-lEGL',
	'-lGLESv2',
	'-lgbm',
})

pkg.deps = {
	'$builddir/pkg/opengldummy/libEGL.so',
	'$builddir/pkg/opengldummy/libGLESv2.so',
	'$builddir/pkg/libgbm/libgbm.so',
	'pkg/libgbm/headers',
	'pkg/libdrm/headers',
	'pkg/libinput/headers',
	'pkg/libudev-zero/headers',
	'pkg/libxkbcommon/headers',
	'pkg/opengldummy/headers',
	'pkg/seatd/headers',
	'pkg/pixman/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
	'$outdir/drm-protocol.h',
	'$outdir/drm-client-protocol.h',
	'$outdir/idle-inhibit-unstable-v1-protocol.h',
	'$outdir/idle-protocol.h',
	'$outdir/input-method-unstable-v2-protocol.h',
	'$outdir/linux-dmabuf-unstable-v1-protocol.h',
	'$outdir/primary-selection-unstable-v1-protocol.h',
	'$outdir/server-decoration-protocol.h',
	'$outdir/text-input-unstable-v3-protocol.h',
	'$outdir/virtual-keyboard-unstable-v1-protocol.h',
	'$outdir/wlr-data-control-unstable-v1-protocol.h',
	'$outdir/wlr-export-dmabuf-unstable-v1-protocol.h',
	'$outdir/wlr-foreign-toplevel-management-unstable-v1-protocol.h',
	'$outdir/wlr-gamma-control-unstable-v1-protocol.h',
	'$outdir/wlr-input-inhibitor-unstable-v1-protocol.h',
	'$outdir/wlr-layer-shell-unstable-v1-protocol.h',
	'$outdir/wlr-output-management-unstable-v1-protocol.h',
	'$outdir/wlr-output-power-management-unstable-v1-protocol.h',
	'$outdir/wlr-screencopy-unstable-v1-protocol.h',
	'$outdir/wlr-virtual-pointer-unstable-v1-protocol.h',
	'$outdir/xdg-decoration-unstable-v1-protocol.h',
	'$outdir/xdg-output-unstable-v1-protocol.h',
	'$outdir/xdg-shell-protocol.h',
	'$outdir/libudev.h',
}

build('copy', '$outdir/idle-inhibit-unstable-v1-protocol.h', '$builddir/pkg/wayland-protocols/include/idle-inhibit-unstable-v1-server-protocol.h')
build('copy', '$outdir/linux-dmabuf-unstable-v1-protocol.h', '$builddir/pkg/wayland-protocols/include/linux-dmabuf-unstable-v1-server-protocol.h')
build('copy', '$outdir/primary-selection-unstable-v1-protocol.h', '$builddir/pkg/wayland-protocols/include/primary-selection-unstable-v1-server-protocol.h')
build('copy', '$outdir/text-input-unstable-v3-protocol.h', '$builddir/pkg/wayland-protocols/include/text-input-unstable-v3-server-protocol.h')
build('copy', '$outdir/xdg-decoration-unstable-v1-protocol.h', '$builddir/pkg/wayland-protocols/include/xdg-decoration-unstable-v1-server-protocol.h')
build('copy', '$outdir/xdg-output-unstable-v1-protocol.h', '$builddir/pkg/wayland-protocols/include/xdg-output-unstable-v1-server-protocol.h')
build('copy', '$outdir/xdg-shell-protocol.h', '$builddir/pkg/wayland-protocols/include/xdg-shell-server-protocol.h')
build('copy', '$outdir/libudev.h', '$builddir/pkg/libudev-zero/include/udev.h')


waylandproto('protocol/drm.xml', {
        client='drm-client-protocol.h',
        server='drm-protocol.h',
        code='drm-protocol.c',
})

waylandproto('protocol/idle.xml', {
        client='idle-client-protocol.h',
        server='idle-protocol.h',
        code='idle-protocol.c',
})

waylandproto('protocol/input-method-unstable-v2.xml', {
        client='input-method-unstable-v2-client-protocol.h',
        server='input-method-unstable-v2-protocol.h',
        code='input-method-unstable-v2-protocol.c',
})

waylandproto('protocol/server-decoration.xml', { 
        client='server-decoration-client-protocol.h', 
        server='server-decoration-protocol.h', 
        code='server-decoration-protocol.c',
})

waylandproto('protocol/virtual-keyboard-unstable-v1.xml', { 
        client='virtual-keyboard-unstable-v1-client-protocol.h', 
        server='virtual-keyboard-unstable-v1-protocol.h', 
        code='virtual-keyboard-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-data-control-unstable-v1.xml', { 
        client='wlr-data-control-unstable-v1-client-protocol.h', 
        server='wlr-data-control-unstable-v1-protocol.h', 
        code='wlr-data-control-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-export-dmabuf-unstable-v1.xml', { 
        client='wlr-export-dmabuf-unstable-v1-client-protocol.h', 
        server='wlr-export-dmabuf-unstable-v1-protocol.h', 
        code='wlr-export-dmabuf-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-foreign-toplevel-management-unstable-v1.xml', { 
        client='wlr-foreign-toplevel-management-unstable-v1-client-protocol.h', 
        server='wlr-foreign-toplevel-management-unstable-v1-protocol.h', 
        code='wlr-foreign-toplevel-management-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-gamma-control-unstable-v1.xml', { 
        client='wlr-gamma-control-unstable-v1-client-protocol.h', 
        server='wlr-gamma-control-unstable-v1-protocol.h', 
        code='wlr-gamma-control-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-input-inhibitor-unstable-v1.xml', { 
        client='wlr-input-inhibitor-unstable-v1-client-protocol.h', 
        server='wlr-input-inhibitor-unstable-v1-protocol.h', 
        code='wlr-input-inhibitor-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-layer-shell-unstable-v1.xml', { 
        client='wlr-layer-shell-unstable-v1-client-protocol.h', 
        server='wlr-layer-shell-unstable-v1-protocol.h', 
        code='wlr-layer-shell-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-output-management-unstable-v1.xml', { 
        client='wlr-output-management-unstable-v1-client-protocol.h', 
        server='wlr-output-management-unstable-v1-protocol.h', 
        code='wlr-output-management-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-output-power-management-unstable-v1.xml', { 
        client='wlr-output-power-management-unstable-v1-client-protocol.h', 
        server='wlr-output-power-management-unstable-v1-protocol.h', 
        code='wlr-output-power-management-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-screencopy-unstable-v1.xml', { 
        client='wlr-screencopy-unstable-v1-client-protocol.h', 
        server='wlr-screencopy-unstable-v1-protocol.h', 
        code='wlr-screencopy-unstable-v1-protocol.c',
})

waylandproto('protocol/wlr-virtual-pointer-unstable-v1.xml', { 
        client='wlr-virtual-pointer-unstable-v1-client-protocol.h', 
        server='wlr-virtual-pointer-unstable-v1-protocol.h', 
        code='wlr-virtual-pointer-unstable-v1-protocol.c',
})

lib('libwlroots.a', [[
	backend/(
		backend.c
		drm/(
			atomic.c
			backend.c
			cvt.c
			drm.c
			legacy.c
			monitor.c
			renderer.c
			properties.c
			util.c
		)
		headless/(
			backend.c
			output.c
		)
		wayland/(
                        backend.c
                        output.c
			pointer.c
			seat.c
			tablet_v2.c
		)
		libinput/(
			backend.c
			events.c
			keyboard.c
			pointer.c
			switch.c
			tablet_pad.c
			tablet_tool.c
			touch.c
		)
		multi/backend.c
		session/session.c
	)
	render/(
		dmabuf.c
		drm_format_set.c
		egl.c
		pixel_format.c
		swapchain.c
		wlr_renderer.c
		wlr_texture.c
		allocator/(allocator.c shm.c drm_dumb.c)
		gles2/(pixel_format.c renderer.c texture.c)
		pixman/(pixel_format.c renderer.c)
	)
	types/(
		data_device/wlr_data_device.c
		data_device/wlr_data_offer.c
		data_device/wlr_data_source.c
		data_device/wlr_drag.c
		output/cursor.c
		output/output.c
		output/render.c
		output/state.c
		output/transform.c
		scene/subsurface_tree.c
		scene/surface.c
		scene/wlr_scene.c
		scene/output_layout.c
		scene/xdg_shell.c
		scene/layer_shell_v1.c
		seat/wlr_seat_keyboard.c
		seat/wlr_seat_pointer.c
		seat/wlr_seat_touch.c
		seat/wlr_seat.c
		tablet_v2/wlr_tablet_v2_pad.c
		tablet_v2/wlr_tablet_v2_tablet.c
		tablet_v2/wlr_tablet_v2_tool.c
		tablet_v2/wlr_tablet_v2.c
		xdg_shell/wlr_xdg_popup.c
		xdg_shell/wlr_xdg_positioner.c
		xdg_shell/wlr_xdg_shell.c
		xdg_shell/wlr_xdg_surface.c
		xdg_shell/wlr_xdg_toplevel.c
		buffer/buffer.c
		buffer/client.c
		buffer/dmabuf.c
		buffer/readonly_data.c
		buffer/resource.c
		buffer/shm_client.c
		wlr_compositor.c
		wlr_cursor.c
		wlr_damage_ring.c
		wlr_data_control_v1.c
		wlr_drm.c
		wlr_export_dmabuf_v1.c
		wlr_foreign_toplevel_management_v1.c
		wlr_fullscreen_shell_v1.c
		wlr_gamma_control_v1.c
		wlr_idle_inhibit_v1.c
		wlr_idle.c
		wlr_idle_notify_v1.c
		wlr_input_device.c
		wlr_input_inhibitor.c
		wlr_input_method_v2.c
		wlr_keyboard.c
		wlr_keyboard_group.c
		wlr_keyboard_shortcuts_inhibit_v1.c
		wlr_layer_shell_v1.c
		wlr_linux_dmabuf_v1.c
		wlr_matrix.c
		wlr_output_damage.c
		wlr_output_layout.c
		wlr_output_management_v1.c
		wlr_output_power_management_v1.c
		wlr_pointer_constraints_v1.c
		wlr_pointer_gestures_v1.c
		wlr_pointer.c
		wlr_presentation_time.c
		wlr_primary_selection_v1.c
		wlr_primary_selection.c
		wlr_region.c
		wlr_relative_pointer_v1.c
		wlr_screencopy_v1.c
		wlr_server_decoration.c
		wlr_session_lock_v1.c
		wlr_single_pixel_buffer_v1.c
		wlr_subcompositor.c
		wlr_switch.c
		wlr_tablet_pad.c
		wlr_tablet_tool.c
		wlr_text_input_v3.c
		wlr_touch.c
		wlr_viewporter.c
		wlr_virtual_keyboard_v1.c
		wlr_virtual_pointer_v1.c
		wlr_xcursor_manager.c
		wlr_xdg_activation_v1.c
		wlr_xdg_decoration_v1.c
		wlr_xdg_foreign_v1.c
		wlr_xdg_foreign_v2.c
		wlr_xdg_foreign_registry.c
		wlr_xdg_output_v1.c
		wlr_drm_lease_v1.c
	)
	util/(
		addon.c
		array.c
		box.c
		env.c
		global.c
		log.c
		region.c
		set.c
		shm.c
		time.c
		token.c
	)
	xcursor/(wlr_xcursor.c xcursor.c)
	$dir/pnpids.c
	drm-protocol.c.o
	idle-protocol.c.o
	input-method-unstable-v2-protocol.c.o
	server-decoration-protocol.c.o
	virtual-keyboard-unstable-v1-protocol.c.o
	wlr-data-control-unstable-v1-protocol.c.o
	wlr-export-dmabuf-unstable-v1-protocol.c.o
	wlr-foreign-toplevel-management-unstable-v1-protocol.c.o
	wlr-gamma-control-unstable-v1-protocol.c.o
	wlr-input-inhibitor-unstable-v1-protocol.c.o
	wlr-layer-shell-unstable-v1-protocol.c.o
	wlr-output-management-unstable-v1-protocol.c.o
	wlr-output-power-management-unstable-v1-protocol.c.o
	wlr-screencopy-unstable-v1-protocol.c.o
	wlr-virtual-pointer-unstable-v1-protocol.c.o
	$builddir/pkg/(
		libdrm/libdrm.a.d
		libinput/libinput.a.d
		libudev-zero/libudev.a.d
		libxkbcommon/libxkbcommon.a.d
		pixman/libpixman.a.d
		seatd/libseat.a.d
		wayland/libwayland-cursor.a.d
		wayland/libwayland-server.a.d
		wayland-protocols/drm-lease-v1-protocol.c.o
		wayland-protocols/ext-session-lock-v1-protocol.c.o
		wayland-protocols/fullscreen-shell-unstable-v1-protocol.c.o
		wayland-protocols/idle-inhibit-unstable-v1-protocol.c.o
		wayland-protocols/keyboard-shortcuts-inhibit-unstable-v1-protocol.c.o
		wayland-protocols/linux-dmabuf-unstable-v1-protocol.c.o
		wayland-protocols/pointer-constraints-unstable-v1-protocol.c.o
		wayland-protocols/pointer-gestures-unstable-v1-protocol.c.o
		wayland-protocols/presentation-time-protocol.c.o
		wayland-protocols/primary-selection-unstable-v1-protocol.c.o
		wayland-protocols/relative-pointer-unstable-v1-protocol.c.o
		wayland-protocols/single-pixel-buffer-v1-protocol.c.o
		wayland-protocols/tablet-unstable-v2-protocol.c.o
		wayland-protocols/text-input-unstable-v3-protocol.c.o
		wayland-protocols/viewporter-protocol.c.o
		wayland-protocols/xdg-activation-v1-protocol.c.o
		wayland-protocols/xdg-decoration-unstable-v1-protocol.c.o
		wayland-protocols/xdg-shell-protocol.c.o
		wayland-protocols/linux-dmabuf-unstable-v1-protocol.c.o
		wayland-protocols/presentation-time-protocol.c.o
		wayland-protocols/primary-selection-unstable-v1-protocol.c.o
		wayland-protocols/text-input-unstable-v3-protocol.c.o
		wayland-protocols/xdg-decoration-unstable-v1-protocol.c.o
		wayland-protocols/xdg-output-unstable-v1-protocol.c.o
		wayland-protocols/xdg-shell-protocol.c.o
)]])

exe('tw', [[
	libwlroots.a
	libwlroots.a.d 
	tinywl/tinywl.c
]])

file('lib/libwlroots.a', '755', '$outdir/libwlroots.a')
file('bin/tw', '755', '$outdir/tw')


fetch 'git'
