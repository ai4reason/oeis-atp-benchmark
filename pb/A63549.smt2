;; sequence(s): A63549
;; terms: 1 1 3 2 10 5 35 14 126 42 462 132 1716 429 6435 1430 24310 4862 92378 16796
;; small program: loop2((1 + y) * (x * y), y - 1, x div 2, 1, x) div loop(x * y, x, 1)
;; fast program: loop(((1 + (y + y)) * (2 * x)) div (2 + y), (x - 1) div 2, 1) * loop(1, x mod 2, 1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f3 () Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 1 y) (* x y)))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (- y 1))))
(assert (forall ((x Int)) (= (h0 x) (div x 2))))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (small x) (div (w0 x) (v1 x)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (div (* (+ 1 (+ y y)) (* 2 x)) (+ 2 y)))))
(assert (forall ((x Int)) (= (g2 x) (div (- x 1) 2))))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (= f3 1))
(assert (forall ((x Int)) (= (g3 x) (mod x 2))))
(assert (forall ((x Int)) (= (h3 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y f3))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v2 x) (v3 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
