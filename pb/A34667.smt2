;; sequence(s): A34667
;; terms: 8 90 2210 73710 2734994 105736950 4161281930 165132191790 6579317233634 262657136433510 10496011084557050 419635308642959070 16781313068980398674 671170570551043634070 26845184104404418478570 1073774593035215963441550
;; small program: loop2(1 + loop(x + x, y, x), y, 1 + 2, 1, x) * (1 + loop((2 * (x + x)) + x, x, 1))
;; fast program: loop((1 + (x * x)) * (1 + x), 1, loop(x + x, x, 1)) * (1 + loop2(x * y, y, x, 1, 1 + (2 + 2)))
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun i5 () Int)
(declare-fun j5 () Int)
(declare-fun u5 (Int Int Int) Int)
(declare-fun v5 (Int Int Int) Int)
(declare-fun w5 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (v1 x y)))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 (+ 1 2)))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (f2 x) (+ (* 2 (+ x x)) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (small x) (* (w0 x) (+ 1 (v2 x))))))
(assert (forall ((x Int)) (= (f3 x) (* (+ 1 (* x x)) (+ 1 x)))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (f4 x) (+ x x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (h3 x) (v4 x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) y)))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (= i5 1))
(assert (= j5 (+ 1 (+ 2 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u5 x y z) (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v5 x y z) (ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w5 x) (u5 (h5 x) i5 j5))))
(assert (forall ((x Int)) (= (fast x) (* (v3 x) (+ 1 (w5 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
