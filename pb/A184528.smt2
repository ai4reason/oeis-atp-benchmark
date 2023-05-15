;; sequence(s): A184528
;; terms: 1 2 4 5 6 7 8 10 11 12 13 14 15 17 18 19 20 21 23 24
;; small program: (((((((((((x div (2 + 2)) + x) div (2 + 2)) + 2) div 2) + 1) + x) div 2) + 1) div (1 + 2)) + x) + 1
;; fast program: ((((((((x div (2 + (2 * (2 + 2)))) + x) div (1 + (2 + (2 + 2)))) + x) div 2) - 1) div (1 + 2)) + x) + 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (div (+ (+ (div (+ (div (+ (div x (+ 2 2)) x) (+ 2 2)) 2) 2) 1) x) 2) 1) (+ 1 2)) x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- (div (+ (div (+ (div x (+ 2 (* 2 (+ 2 2)))) x) (+ 1 (+ 2 (+ 2 2)))) x) 2) 1) (+ 1 2)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
