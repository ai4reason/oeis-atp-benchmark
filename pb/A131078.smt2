;; sequence(s): A131078
;; terms: 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1
;; small program: 1 - (((x div 2) div 2) mod 2)
;; fast program: 1 - ((x div (2 + 2)) mod 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- 1 (mod (div (div x 2) 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (- 1 (mod (div x (+ 2 2)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
