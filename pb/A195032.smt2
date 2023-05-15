;; sequence(s): A195032
;; terms: 0 5 17 27 51 66 102 122 170 195 255 285 357 392 476 516 612 657 765 815
;; small program: ((((((((((((((((1 + (2 + (2 + 2))) * (1 + (x div 2))) + x) * 2) + 2) * 2) + 1) - x) * x) div 2) + 1) + 2) * 2) + x) div 2) div 2) div 2
;; fast program: ((((((((((((((((2 * ((1 + (2 + (2 + 2))) * (x div 2))) + x) * 2) + 2) + x) * x) + 2) div 2) + 2) div 2) + x) + x) + x) + x) div 2) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (div (div (+ (* (+ (+ (div (* (- (+ (* (+ (* (+ (* (+ 1 (+ 2 (+ 2 2))) (+ 1 (div x 2))) x) 2) 2) 2) 1) x) x) 2) 1) 2) 2) x) 2) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (+ (+ (div (+ (div (+ (* (+ (+ (* (+ (* 2 (* (+ 1 (+ 2 (+ 2 2))) (div x 2))) x) 2) 2) x) x) 2) 2) 2) 2) x) x) x) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
