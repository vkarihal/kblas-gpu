.PHONY: all clean

all:
	(cd src && make -j1)
	(cd testing && make -j1)

clean:
	rm -f -v ./lib/*.a
	(cd src && make clean)
	(cd testing && make clean)
