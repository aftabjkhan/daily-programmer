all: braille braille-binary

braille:
	ocamlc -o braille str.cma braille.ml

braille-binary:
	ocamlc -o braille-binary str.cma braille-binary.ml
	#ocamlc -o bb str.cma bb.ml


.PHONY: clean
clean:
	rm -f *.cmo *.cmi *.o braille braille-binary