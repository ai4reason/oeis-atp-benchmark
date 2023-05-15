;; sequence(s): A138987
;; terms: 1 2 3 4 5 6 15 17 19 21 23 25 41 44 47 50 53 56 79 83
;; small program: 1 + (((2 + x) * ((x div 2) div (1 + 2))) + x)
;; fast program: 1 + (((2 + x) * (x div (2 + (2 + 2)))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (* (+ 2 x) (div (div x 2) (+ 1 2))) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* (+ 2 x) (div x (+ 2 (+ 2 2)))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
