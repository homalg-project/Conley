all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g \
		PackageInfo.g VERSION \
		doc/Conley.bib doc/*.xml \
		gap/*.gd gap/*.gi \
		examples/*
	        gapL makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gapL -x 80 maketest.g

archive: doc
	(mkdir -p ../tar; cd ..; tar czvf tar/Conley.tar.gz --exclude ".DS_Store" Conley/doc/*.* Conley/gap/*.{gi,gd} Conley/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g} Conley/examples/*.g)

WEBPOS=~/gap/pkg/Conley/public_html
WEBPOS_FINAL=~/Sites/Conley

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.Conley
	cp doc/manual.pdf ${WEBPOS}/Conley.pdf
	cp doc/*.{css,html} ${WEBPOS}
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
#	cp ../tar/Conley.tar.gz ${WEBPOS}

