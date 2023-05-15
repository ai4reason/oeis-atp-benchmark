;; sequence(s): A133874
;; terms: 1 1 1 1 2 2 2 2 3 3 3 3 0 0 0 0 1 1 1 1
;; small program: (1 + ((x div 2) div 2)) mod (2 + 2)
;; fast program: (1 + (x div (2 + 2))) mod (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (+ 1 (div (div x 2) 2)) (+ 2 2)))))
(assert (forall ((x Int)) (= (fast x) (mod (+ 1 (div x (+ 2 2))) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
