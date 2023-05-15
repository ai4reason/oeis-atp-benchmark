;; sequence(s): A225553
;; terms: 0 1 2 3 4 4 5 5 6 7 7 8 8 9 9 10 10 11 11 12
;; small program: (((x - ((x * x) div 2)) + x) div (2 + x)) + x
;; fast program: (((((2 - x) * x) - 2) div (2 * (2 + x))) + 1) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (- x (div (* x x) 2)) x) (+ 2 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- (* (- 2 x) x) 2) (* 2 (+ 2 x))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
