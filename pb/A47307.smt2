;; sequence(s): A47307
;; terms: 3 4 5 6 10 11 12 13 17 18 19 20 24 25 26 27 31 32 33 34
;; small program: ((1 + 2) * (1 + ((x div 2) div 2))) + x
;; fast program: ((1 + 2) * (1 + (x div (2 + 2)))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 2) (+ 1 (div (div x 2) 2))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (+ 1 (div x (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
