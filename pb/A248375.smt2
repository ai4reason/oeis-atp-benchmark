;; sequence(s): A248375
;; terms: 0 1 2 3 4 5 6 7 9 10 11 12 13 14 15 16 18 19 20 21
;; small program: (((x div 2) div 2) div 2) + x
;; fast program: (x div (2 * (2 + 2))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (div (div x 2) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div x (* 2 (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
