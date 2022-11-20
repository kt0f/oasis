pkg.hdrs = copy('$outdir/include', '$srcdir/', {'tllist.h'})
pkg.hdrs.install = true

fetch 'git'
