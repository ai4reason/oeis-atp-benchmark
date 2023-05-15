;; sequence(s): A172331
;; terms: 0 6 12 18 25 31 37 43 50 56 62 68 75 81 87 93 100 106 112 118
;; small program: (2 * ((x + x) + x)) + ((x div 2) div 2)
;; fast program: (2 * ((x + x) + x)) + (x div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (+ (+ x x) x)) (div (div x 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ (+ x x) x)) (div x (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
