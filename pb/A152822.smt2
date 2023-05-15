;; sequence(s): A152822
;; terms: 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1
;; small program: (if ((x div 2) mod 2) <= 0 then 1 else x) mod 2
;; fast program: if ((2 + x) mod (2 + 2)) <= 0 then 0 else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (ite (<= (mod (div x 2) 2) 0) 1 x) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (+ 2 x) (+ 2 2)) 0) 0 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
