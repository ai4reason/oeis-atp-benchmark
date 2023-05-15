;; sequence(s): A314025
;; terms: 1 5 11 15 20 25 29 34 39 43 49 54 59 65 69 74 79 83 88 93
;; small program: ((((((((((((((((((loop(y - ((((x div 2) + x) + x) div (1 + 2)), x, 2) div 2) + x) + x) + x) + x) * 2) + 1) + x) div (1 + 2)) - x) - x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x
;; fast program: (((((((((((((((((((((((((((2 * (2 * (x + x))) + x) div (1 + (2 + (2 * (2 + 2))))) + 1) + x) div (if x <= 0 then 1 else 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) - x) - x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (+ (+ (div x 2) x) x) (+ 1 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (+ (+ (* (* (- (- (div (+ (+ (* (+ (+ (+ (+ (div (v0 x) 2) x) x) x) x) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (* (* (- (- (div (+ (+ (* (+ (+ (div (+ (+ (* (+ (+ (div (+ (+ (div (+ (* 2 (* 2 (+ x x))) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) x) (ite (<= x 0) 1 2)) x) x) 2) 1) x) (+ 1 2)) x) x) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
