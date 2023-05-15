;; sequence(s): A186349
;; terms: 1 2 4 5 8 10 13 15 19 22 26 29 34 38 43 47 53 58 64 69
;; small program: 1 + (((((x * x) div 2) + x) div (2 + 2)) + x)
;; fast program: 1 + ((((2 + x) * x) div (2 * (2 + 2))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (div (+ (div (* x x) 2) x) (+ 2 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (div (* (+ 2 x) x) (* 2 (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
