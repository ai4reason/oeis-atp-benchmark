;; sequence(s): A186500
;; terms: 2 6 9 12 16 19 22 25 29 32 35 38 42 45 48 51 54 58 61 64
;; small program: loop((((2 + (2 + (2 + y))) * y) div x) + y, x + x, 2)
;; fast program: (loop(((((((y * y) + x) div (2 + (2 + x))) + y) + y) + y) + y, 1 + x, 0) - x) - 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* (+ 2 (+ 2 (+ 2 y))) y) x) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (+ (+ (+ (div (+ (* y y) x) (+ 2 (+ 2 x))) y) y) y) y))))
(assert (forall ((x Int)) (= (g1 x) (+ 1 x))))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (- (- (v1 x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
