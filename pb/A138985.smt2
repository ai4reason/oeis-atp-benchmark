;; sequence(s): A138985
;; terms: 1 2 3 4 11 13 15 17 29 32 35 38 55 59 63 67 89 94 99 104
;; small program: 1 + (((2 + x) * ((x div 2) div 2)) + x)
;; fast program: 1 + (((2 + x) * (x div (2 + 2))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (* (+ 2 x) (div (div x 2) 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* (+ 2 x) (div x (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
