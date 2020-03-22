.PHONY: all clean

all:
	(cd src && make -j12)
	(cd testing && make -j12)

clean:
	rm -f -v ./lib/*.a
	(cd src && make clean)
	(cd testing && make clean)
