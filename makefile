all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g \
		PackageInfo.g VERSION \
		doc/Conley.bib doc/*.xml \
		gap/*.gd gap/*.gi examples/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/Conley.tar.gz --exclude ".DS_Store" --exclude "*~" Conley/doc/*.* Conley/doc/clean Conley/gap/*.{gi,gd} Conley/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g} Conley/examples/*.g)

WEBPOS=~/gap/pkg/Conley/public_html
WEBPOS_FINAL=~/Sites/homalg-project/Conley

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.Conley
	cp doc/manual.pdf ${WEBPOS}/Conley.pdf
	cp doc/*.{css,html} ${WEBPOS}
	rm -f ${WEBPOS}/*.tar.gz
	mv ../tar/Conley.tar.gz ${WEBPOS}/Conley-`cat VERSION`.tar.gz
	rm -f ${WEBPOS_FINAL}/*.tar.gz
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	ln -s Conley-`cat VERSION`.tar.gz ${WEBPOS_FINAL}/Conley.tar.gz
