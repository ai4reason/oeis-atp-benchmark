;; sequence(s): A266397
;; terms: 0 0 9 31 70 130 215 329 476 660 885 1155 1474 1846 2275 2765 3320 3944 4641 5415
;; small program: loop2(loop(2 + (x + y), y, x) + y, 2 + y, x, 0, 0)
;; fast program: ((((1 + x) * ((2 * (2 * (x * x))) - x)) div (2 + (2 + 2))) + (2 * ((x - 2) * x))) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ 2 y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 0))
(assert (= j0 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* (+ 1 x) (- (* 2 (* 2 (* x x))) x)) (+ 2 (+ 2 2))) (* 2 (* (- x 2) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
