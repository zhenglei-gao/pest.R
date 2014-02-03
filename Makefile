all : install

.PHONY : install_devtools
install_devtools :
	Rscript -e "require('devtools'); install('../sitra-pest')"
	cp exec/genSitraPestInput /cygdrive/d/user/bin/

.PHONY : install
install : deps
	R CMD build '.'
	R CMD install pest_0.01.tar.gz

deps :
	make -C deps/template
