;; sequence(s): A116083
;; terms: 2 6 8 24 128 384 32768 98304 2147483648 6442450944
;; small program: loop2(y + y, x * x, x, 2, 1) * loop(1 + 2, x mod 2, 1)
;; fast program: loop2(x * y, y * y, x div 2, loop(1 + 2, x mod 2, 1), 2 + 2) * 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun f3 () Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun i2 (Int) Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ y y))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 2))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (= f1 (+ 1 2)))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (small x) (* (w0 x) (v1 x)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (* y y))))
(assert (forall ((x Int)) (= (h2 x) (div x 2))))
(assert (= f3 (+ 1 2)))
(assert (forall ((x Int)) (= (g3 x) (mod x 2))))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y f3))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (i2 x) (v3 x))))
(assert (= j2 (+ 2 2)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) (i2 x) j2))))
(assert (forall ((x Int)) (= (fast x) (* (w2 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)