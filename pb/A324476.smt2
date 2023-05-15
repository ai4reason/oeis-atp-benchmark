;; sequence(s): A324476
;; terms: 1 2 5 8 11 14 19 23 28 32 38
;; small program: ((loop((x - (y div (2 + 2))) + y, x, 2) div 2) + (x div 2)) + x
;; fast program: ((((((1 + 2) * ((x * x) div 2)) - x) div (2 * (2 + 2))) + 1) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x (div y (+ 2 2))) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (v0 x) 2) (div x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (- (* (+ 1 2) (div (* x x) 2)) x) (* 2 (+ 2 2))) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
