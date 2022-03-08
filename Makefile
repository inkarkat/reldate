TARGET := README.md
all: $(TARGET)

README.md: bin/reldate
	COLUMNS=80 $< --man | \
	    sed -n '/DESCRIPTION/,$${ s/^ \{4\}//; s/^ \{2\}/    /; s/^[[:upper:][:space:]]\+$$/### &/; p }' \
	    > $@

.PHONY: clean
clean:
	rm -rf $(TARGET)
