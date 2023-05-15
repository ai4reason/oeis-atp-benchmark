;; sequence(s): A190055
;; terms: 2 6 10 13 16 20 24 27 30 34 38 41 44 48 51 55 58 62 65 69
;; small program: (loop(((y * y) div (2 * (2 + x))) + y, 2 + (x + x), 0) - (x div (2 + 2))) + x
;; fast program: ((((((((((((2 - (((1 + x) div (2 + (2 * (2 + (2 + 2))))) + x)) div (2 + 2)) + x) + 2) + x) * 2) + 1) + x) * 2) + 1) + x) div (2 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (* 2 (+ 2 x))) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (v0 x) (div x (+ 2 2))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (* (+ (+ (* (+ (+ (+ (div (- 2 (+ (div (+ 1 x) (+ 2 (* 2 (+ 2 (+ 2 2))))) x)) (+ 2 2)) x) 2) x) 2) 1) x) 2) 1) x) (+ 2 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
