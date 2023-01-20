file('bin/meson', '755', '$dir/meson')
for f in iterlines('pylibs.txt') do
	file('lib/python3.10/'..f, '644', '$srcdir/'..f)
end
man{'man/meson.1'}

fetch 'git'
