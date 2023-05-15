There are 29687 problems in the dataset consisting of equalities between
pair of programs (smallest and fastest according to some abstract time) generating the same OEIS sequence. Therefore, there is at most one problem per OEIS sequence.

## Set of problems
The list of problems passing the syntactic check for induction 
is given in `aind_sem`.
The list of problems passing the syntactic check and the semantic check for induction is given in `aind_syn`.
Equalities (problems) which have been verified to hold on the first 100 nonnegative integers are listed in `all_verified100`. 
The others `all_nonverified100` were only verified until one of the program raised an error usually because of the timeout limit.

## Experiments
Run `cvc5` on the `pb` subdirectory with 8 cores:
```
sh make.sh pb cvc5 8
```

## Analysis of the results
Number of problems solved for cvc5
```
grep -rl "unsat" pb-small/*.cvc5 | wc -l
grep -rl "unsat" pb/*.cvc5 | wc -l
```

Checking if some of the problems solved in `pb-rand` contains loop2:
```
grep -r "loop2" $(for i in $(grep -rl "unsat" pb-rand/*.cvc5); do echo "${i%.cvc5}.smt2"; done)
```

## Debugging
The following commands generate a folder "pb-rand" (or pb-small) containing
100 random (or small) problems for debugging:
```
sh rand.sh pb 100;
sh small.sh pb 100;
```

## Paper

A paper about the benchmark and initial results of ATPs and SMTs on the problems is at https://arxiv.org/abs/2304.02986 .

## Bounties

We selected 1000 of the initially unsolved problems from the benchmark
and translated the SMT2 representation into a set theoretic representation used by 
the Megalodon ITP system (https://github.com/ai4reason/Megalodon).
We then placed a bounty of 1 Proofgold (http://proofgold.net/) bar on each of the corresponding
formal propositions.
As a consequence anyone can claim 1 Proofgold bar by giving
an appropriate proof term for the corresponding problem. The details are available at http://grid01.ciirc.cvut.cz/~chad/oeis-mgpg1000.tgz .
