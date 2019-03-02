TARGET := README.md
all: $(TARGET)

README.md: bin/reldate
	$< --man | \
	    sed -n '/DESCRIPTION/,$${ s/^ \{4\}//; p }' | \
	    ansi2markdown \
	    > $@

.PHONY: clean
clean:
	rm -rf $(TARGET)
