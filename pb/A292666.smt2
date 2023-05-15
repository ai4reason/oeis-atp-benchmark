;; sequence(s): A292666
;; terms: 3 6 9 12 15 18 22 25 28 31 34 37 41 44 47 50 53 56 60 63
;; small program: ((1 + 2) * (1 + x)) + ((x div 2) div (1 + 2))
;; fast program: ((1 + 2) * (1 + x)) + (x div (2 + (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 2) (+ 1 x)) (div (div x 2) (+ 1 2))))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (+ 1 x)) (div x (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
