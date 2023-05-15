;; sequence(s): A307513
;; terms: 1 2 4 5 7 8 10 11 12 14 15 17 18 20 21 23 24 25 27 28
;; small program: (((2 - ((x - ((x div 2) div (2 + (2 + 2)))) div (2 * (2 + 2)))) + x) div 2) + x
;; fast program: (((2 - ((x - (x div (1 + (2 + 2)))) div (1 + (2 + (2 + 2))))) + x) div 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (- 2 (div (- x (div (div x 2) (+ 2 (+ 2 2)))) (* 2 (+ 2 2)))) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (- 2 (div (- x (div x (+ 1 (+ 2 2)))) (+ 1 (+ 2 (+ 2 2))))) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
