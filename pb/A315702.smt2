;; sequence(s): A315702
;; terms: 1 6 12 17 23 29 33 39 45 50 56 62 68 74 79 85 91 95 101 107
;; small program: (((((((loop(((((x div 2) div 2) div 2) + y) - (x div 2), x, 1) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) div (1 + 2)) + x) + x
;; fast program: ((((((((((((((((x div (1 + (2 + (2 * (2 + 2))))) + x) + x) * 2) + (if x <= 0 then 1 else 2)) + x) div (1 + 2)) + x) + x) * 2) + (if x <= 0 then 1 else x)) + x) * 2) + 1) + x) div (1 + 2)) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (+ (div (div (div x 2) 2) 2) y) (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (* (* (+ (+ (v0 x) x) x) (ite (<= x 0) 1 2)) 2) 1) (+ 1 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (div (+ (+ (* (+ (+ (* (+ (+ (div (+ (+ (* (+ (+ (div x (+ 1 (+ 2 (* 2 (+ 2 2))))) x) x) 2) (ite (<= x 0) 1 2)) x) (+ 1 2)) x) x) 2) (ite (<= x 0) 1 x)) x) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
