;; sequence(s): A112557
;; terms: 1 4 10 18 30 42 58 78 102 118 150 174 210 240 274 322 360 402 442 498
;; small program: loop((x div (y + y)) + x, x * x, x + x) + 1
;; fast program: loop2(1 + ((x div y) + x), y - 1, x, x, x) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div x (+ y y)) x))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 1))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (+ (div x y) x)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (- y 1))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int)) (= (i1 x) x)))
(assert (forall ((x Int)) (= (j1 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (w1 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)