;; sequence(s): A174962
;; terms: 2 10 81 896 12500 209952 4117715 92274688 2324522934 65000000000 1997181694277 66870753361920 2423000852738024 94452058017243136 3941045013427734375 175244068700240740352 8272402618863367641770
;; small program: loop2((x * y) + x, y, x, loop(2 + (x + y), x, 2), x)
;; fast program: (((1 + x) * (((2 + x) * (2 + x)) + x)) div 2) * loop2(x * y, y, x - 1, 1, 1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 (Int) Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* x y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (i0 x) (v1 x))))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (h2 x) (- x 1))))
(assert (= i2 1))
(assert (forall ((x Int)) (= (j2 x) (+ 1 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 (j2 x)))))
(assert (forall ((x Int)) (= (fast x) (* (div (* (+ 1 x) (+ (* (+ 2 x) (+ 2 x)) x)) 2) (w2 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
