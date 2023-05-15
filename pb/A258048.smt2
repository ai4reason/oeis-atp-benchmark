;; sequence(s): A258048
;; terms: 1 3 4 6 7 9 10 12 13 14 16 17 19 20 22 23 25 26 28 29
;; small program: (((2 + (((1 + (x + x)) div (1 + (2 + 2))) + x)) div (1 + 2)) + 1) + x
;; fast program: ((((2 * (2 + (2 * (x + x)))) div (1 - (2 * (2 * (2 + 2))))) + 2) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ 2 (+ (div (+ 1 (+ x x)) (+ 1 (+ 2 2))) x)) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (* 2 (+ 2 (* 2 (+ x x)))) (- 1 (* 2 (* 2 (+ 2 2))))) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
