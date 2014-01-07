all: dice_roll

dice_roll:
	ocamlc -o dice_roll str.cma dice_roll.ml

.PHONY: test
test:
	./test.sh

.PHONY: clean
clean:
	rm -f *.cmo *.cmi *.o dice_roll