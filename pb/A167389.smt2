;; sequence(s): A167389
;; terms: 2 3 5 6 8 9 10 12 13 15 16 18 19 21 22 23 25 26 28 29
;; small program: (((((1 + (((x div (2 + (2 * (2 + 2)))) - x) div (2 + 2))) div 2) + x) div 2) + 2) + x
;; fast program: (((((1 + 2) * (1 + (2 + x))) + (x div (2 + (2 * (2 + 2))))) div (1 + (2 + (2 + 2)))) + 1) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (div (+ 1 (div (- (div x (+ 2 (* 2 (+ 2 2)))) x) (+ 2 2))) 2) x) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* (+ 1 2) (+ 1 (+ 2 x))) (div x (+ 2 (* 2 (+ 2 2))))) (+ 1 (+ 2 (+ 2 2)))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
