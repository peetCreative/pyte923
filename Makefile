LIB_DIR = te923

default: pyte923

pyte923: setup.py pyte923.pyx $(LIB_DIR)/libte923.a
	python3 setup.py build_ext --inplace && rm -f pyte923.c && rm -Rf build

$(LIB_DIR)/libte923.a:

clean:
	rm *.so
	rm -rf build
