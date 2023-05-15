;; sequence(s): A227394
;; terms: 1 1 2 3 4 5 6 7 7 8 9 10 11 12 13 13 14 15 16 17
;; small program: (((((((((x div (1 + 2)) + x) + x) div (2 + x)) + x) div 2) + x) + x) div (1 + 2)) + 1
;; fast program: ((((((((x + x) + x) div (1 + (2 + (2 + x)))) + x) div 2) + x) + x) div (1 + 2)) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (+ (div (+ (div (+ (+ (div x (+ 1 2)) x) x) (+ 2 x)) x) 2) x) x) (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (div (+ (div (+ (+ x x) x) (+ 1 (+ 2 (+ 2 x)))) x) 2) x) x) (+ 1 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
