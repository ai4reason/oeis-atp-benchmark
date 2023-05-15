;; sequence(s): A47288
;; terms: 4 6 11 13 18 20 25 27 32 34 39 41 46 48 53 55 60 62 67 69
;; small program: (2 * (2 + ((x div 2) + x))) + (x div 2)
;; fast program: (2 * (2 + x)) + ((1 + 2) * (x div 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (+ 2 (+ (div x 2) x))) (div x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ 2 x)) (* (+ 1 2) (div x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
