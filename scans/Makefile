TARGETS=16.sfd 17.sfd 18.sfd

.PHONY: all clean utils

all: $(TARGETS)

.SUFFIXES: .gif .sfd
.gif.sfd:
	-mkdir $*
	./decomp.pl $<
	cd $*;k=0;for i in `ls -1 *.bmp`; do \
	echo -n "[$${k}]";potrace -s $$i; k=`expr $$k + 1`; \
	done;echo ""; \
	cd ..; fontforge -script ./import.pe $* $$k

clean:
	-rm -rf $(TARGETS) $(TARGETS:.sfd=)
