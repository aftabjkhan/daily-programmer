all: braille braille_binary

braille:
	ocamlc -o braille str.cma braille.ml

braille_binary:
	ocamlc -o braille_binary str.cma braille_binary.ml
	#ocamlc -o bb str.cma bb.ml


.PHONY: clean
clean:
	rm -f *.cmo *.cmi *.o braille braille_binary