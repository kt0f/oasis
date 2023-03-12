cflags{
	'-I $dir',
	'-isystem $srcdir/src/include',
	'-isystem $srcdir/src/ucd-tools/src/include',
	'-isystem $builddir/pkg/pcaudiolib/include',
	'-isystem $builddir/pkg/sonic/include',
}


pkg.hdrs = {}
pkg.deps = {'pkg/pcaudiolib/headers', 'pkg/sonic/headers'}

lib('libespeak-ng.a', [[
	src/libespeak-ng/(
		common.c
		mnemonics.c
		error.c
		ieee80.c
		compiledata.c
		compiledict.c
		dictionary.c
		encoding.c
		intonation.c
		langopts.c
		numbers.c
		phoneme.c
		phonemelist.c
		readclause.c
		setlengths.c
		soundicon.c
		spect.c
		ssml.c
		synthdata.c
		synthesize.c
		tr_languages.c
		translate.c
		translateword.c
		voices.c
		wavegen.c
		speech.c
		espeak_api.c
		event.c
		fifo.c
		espeak_command.c
		klatt.c
	)
	src/ucd-tools/src/(
		case.c
		categories.c
		ctype.c
		proplist.c
		scripts.c
		tostring.c
	)
]])

exe('espeak-ng', [[
	src/espeak-ng.c
	libespeak-ng.a
	$builddir/pkg/sonic/libsonic.a
	$builddir/pkg/pcaudiolib/libpcaudio.a
        $builddir/pkg/alsa-lib/libasound.a
]])

datadeps = {}

for f in iterlines('data.txt') do
	build('copy', '$outdir/'..f, '$srcdir/'..f)
	table.insert(datadeps, '$outdir/'..f)
        file('share/'..f, '644', '$outdir/'..f)
end

for f in iterlines('phsource.txt') do
	build('copy', '$outdir/'..f, '$srcdir/'..f)
	table.insert(datadeps, '$outdir/'..f)
end

table.insert(datadeps, '$outdir/espeak-ng')

build(
	'espeak',
	{'$outdir/espeak-ng-data/intonations'},
	datadeps,
	{options='--compile-intonations', datadir='$outdir/espeak-ng-data'}
)

build(
	'espeak',
	{
		'$outdir/espeak-ng-data/phondata',
		'$outdir/espeak-ng-data/phondata-manifest',
		'$outdir/espeak-ng-data/phonindex',
		'$outdir/espeak-ng-data/phontab',
	},
	datadeps,
	{options='--compile-phonemes', datadir='$outdir/espeak-ng-data'}
)

table.insert(datadeps, '$outdir/espeak-ng-data/intonations')
table.insert(datadeps, '$outdir/espeak-ng-data/phondata')

dicts = [[
	af am an ar as az
	ba be bg bn bpy bs
	ca chr cmn cs cv cy
	da de
	el en eo es et eu
	fa fi fr
	ga gd gn grc gu
	hak haw he hi hr ht hu hy
	ia id io is it
	ja jbo
	ka kk kl kn kok ko ku ky
	la lb lfn lt lv
	mi mk ml mr ms mto mt my
	nci ne nl nog no
	om or
	pap pa piqd pl pt py
	qdb quc qu qya
	ro ru
	sd shn si sjn sk sl smj sq sr sv sw
	ta te th tk tn tr tt
	ug uk ur uz
	vi
	yue
]]

for f in iterlines('dictsource.txt') do
	f2 = string.sub(f, 11, -1)
	build('copy', '$outdir/espeak-ng-data/'..f2, '$srcdir/dictsource/'..f2)
	table.insert(datadeps, '$outdir/espeak-ng-data/'..f2)
end

for d in dicts:gmatch("%S+") do
	build(
		'espeak',
		{'$outdir/espeak-ng-data/'..d..'_dict'},
		datadeps,
		{options='--compile='..d, datadir='$outdir/espeak-ng-data'}
	)
        file('share/espeak-ng-data/'..d..'_dict', '644', '$outdir/espeak-ng-data/'..d..'_dict')
end 

file('share/espeak-ng-data/intonations', '644', '$outdir/espeak-ng-data/intonations')
file('share/espeak-ng-data/phondata', '644', '$outdir/espeak-ng-data/phondata')
file('share/espeak-ng-data/phondata-manifest', '644', '$outdir/espeak-ng-data/phondata-manifest')
file('share/espeak-ng-data/phonindex', '644', '$outdir/espeak-ng-data/phonindex')
file('share/espeak-ng-data/phontab', '644', '$outdir/espeak-ng-data/phontab')

file('bin/espeak-ng', '755', '$outdir/espeak-ng')

fetch 'git'
