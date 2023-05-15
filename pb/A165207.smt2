;; sequence(s): A165207
;; terms: 2 2 4 4 2 2 4 4 2 2 4 4 2 2 4 4 2 2 4 4
;; small program: 2 + (2 * ((x div 2) mod 2))
;; fast program: 2 + (((x * x) - x) mod (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (* 2 (mod (div x 2) 2))))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (mod (- (* x x) x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
