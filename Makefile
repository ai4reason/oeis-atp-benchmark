files=$(wildcard *.smt2)
proofs_cvc5 := $(patsubst %.smt2,%.cvc5,$(files))
proofs_vam := $(patsubst %.smt2,%.vam,$(files))

all: $(proofs_vam) $(proofs_cvc5)
cvc5: $(proofs_cvc5)
vam: $(proofs_vam)

clean:
	rm -fv $(proofs_vam) $(proofs_cvc5)

%.cvc5: %.smt2
	timeout 10 ../cvc5 --full-saturate-quant --quant-ind --int-wf-ind --tlimit=3000 $< >$@

%.vam: %.smt2
	timeout 10 ../vampire_rel_master_6320 --time_limit 3s --input_syntax smtlib2 --mode portfolio --schedule induction $< >$@
