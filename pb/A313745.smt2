;; sequence(s): A313745
;; terms: 1 5 10 15 20 26 30 36 41 46 51 56 61 66 71 76 82 86 92 97
;; small program: ((((((((((((2 * (x + x)) + x) div (1 + (2 + (2 * (2 + 2))))) + 1) + x) + (if x <= 0 then 1 else x)) + x) + x) + x) * (1 + 2)) div 2) div 2) + x
;; fast program: ((((((((((((2 * ((x + x) + x)) + x) div (1 + (2 + (2 * (2 + 2))))) + x) * 2) + 2) div (1 + 2)) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) + 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (div (* (+ (+ (+ (+ (+ (+ (div (+ (* 2 (+ x x)) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) x) (ite (<= x 0) 1 x)) x) x) x) (+ 1 2)) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (- (+ (+ (div (+ (* (+ (div (+ (* 2 (+ (+ x x) x)) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) 2) 2) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
