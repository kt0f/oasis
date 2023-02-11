for f in iterlines('pylibs.txt') do
	file('lib/python3.10/'..f, '644', '$srcdir/src/'..f)
end

fetch 'git'
