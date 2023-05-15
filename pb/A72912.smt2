;; sequence(s): A72912
;; terms: 1 1 1 2 2 2 3 3 3 3 4 4 4 5 5 5 6 6 6 7
;; small program: ((((0 - (((x div 2) div 2) div 2)) div (1 + 2)) + x) div (1 + 2)) + 1
;; fast program: ((((x - (x div (2 * (2 + 2)))) + x) + x) div (1 + (2 * (2 + 2)))) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (div (- 0 (div (div (div x 2) 2) 2)) (+ 1 2)) x) (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (- x (div x (* 2 (+ 2 2)))) x) x) (+ 1 (* 2 (+ 2 2)))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
