;; sequence(s): A198083
;; terms: 0 3 5 8 10 13 15 18 20 23 25 27 30 32 35 37 40 42 45 47
;; small program: (x - ((((x div 2) div (1 + (2 + 2))) - x) div 2)) + x
;; fast program: (x - (((x div (2 + (2 * (2 + 2)))) - x) div 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- x (div (- (div (div x 2) (+ 1 (+ 2 2))) x) 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (div (- (div x (+ 2 (* 2 (+ 2 2)))) x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
