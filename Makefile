TARGET := README.md
all: $(TARGET)

README.md: bin/reldate
	COLUMNS=80 $< --man | \
	    sed -n -e '1i# reldate\
	    \
	![Build Status](https://github.com/inkarkat/reldate/actions/workflows/build.yml/badge.svg)\
	    ' -e '/DESCRIPTION/,$${ s/^ \{4\}//; s/^ \{2\}/    /; s/^[[:upper:][:space:]]\+$$/### &/; p }' \
	    > $@

.PHONY: clean
clean:
	rm -rf $(TARGET)
