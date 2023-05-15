;; sequence(s): A172266
;; terms: 0 0 1 2 3 4 4 5 6 7 8 9 9 10 11 12 13 13 14 15
;; small program: ((((x + x) div (1 + (2 + (2 + 2)))) - x) div (2 + 2)) + x
;; fast program: (((2 * (x + x)) + x) div (2 * (2 - (2 * (2 * (2 + 2)))))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (- (div (+ x x) (+ 1 (+ 2 (+ 2 2)))) x) (+ 2 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (* 2 (+ x x)) x) (* 2 (- 2 (* 2 (* 2 (+ 2 2)))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
