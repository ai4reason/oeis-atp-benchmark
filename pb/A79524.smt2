;; sequence(s): A79524
;; terms: 0 1 4 6 10 13 18 22 28 33 40 46 54 61 70 78 88 97 108 118
;; small program: ((((x * x) div 2) + x) div 2) + x
;; fast program: (((2 + x) * x) div (2 + 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (div (* x x) 2) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* (+ 2 x) x) (+ 2 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
