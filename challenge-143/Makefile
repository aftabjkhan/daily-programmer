all: braille braille_binary

braille:
	ocamlc -o braille str.cma braille.ml

braille_binary:
	ocamlc -o braille_binary str.cma braille_binary.ml

.PHONY: test
test:
	./test.sh

.PHONY: clean
clean:
	rm -f *.cmo *.cmi *.o braille braille_binary