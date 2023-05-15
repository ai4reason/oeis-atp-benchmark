;; sequence(s): A264359
;; terms: 9 36 169 784 3600 16641 76729 354025 1633284 7535025 34762816 160376896 739894401 3413480625 15747991081 72652889764 335181944601 1546351938576 7134048689296 32912721515521
;; small program: loop(loop2(loop(loop2(((y * y) + x) div (x + y), x + y, x + x, 1, 1), 1, y) * x, y, 2, 1, x), 1, 2 + x)
;; fast program: loop(loop2(loop(loop2(((((y * y) + y) div (x + y)) + x) + x, x, x - 1, 1, 1), 1, y) * x, y, 2, 1, x), 1, 2 + x)
(set-logic UFNIA)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun i3 () Int)
(declare-fun j3 () Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun i7 () Int)
(declare-fun j7 () Int)
(declare-fun u7 (Int Int Int) Int)
(declare-fun v7 (Int Int Int) Int)
(declare-fun w7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun h6 (Int Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 () Int)
(declare-fun i5 () Int)
(declare-fun j5 (Int) Int)
(declare-fun u5 (Int Int Int) Int)
(declare-fun v5 (Int Int Int) Int)
(declare-fun w5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (div (+ (* y y) x) (+ x y)))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) (+ x y))))
(assert (forall ((x Int)) (= (h3 x) (+ x x))))
(assert (= i3 1))
(assert (= j3 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) i3 j3))))
(assert (forall ((x Int)) (= (f2 x) (w3 x))))
(assert (= g2 1))
(assert (forall ((x Int) (y Int)) (= (h2 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 g2 (h2 x y)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* (v2 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 2))
(assert (= i1 1))
(assert (forall ((x Int)) (= (j1 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 h1 i1 (j1 x)))))
(assert (forall ((x Int)) (= (f0 x) (w1 x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (+ (+ (div (+ (* y y) y) (+ x y)) x) x))))
(assert (forall ((x Int)) (= (g7 x) x)))
(assert (forall ((x Int)) (= (h7 x) (- x 1))))
(assert (= i7 1))
(assert (= j7 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 (h7 x) i7 j7))))
(assert (forall ((x Int)) (= (f6 x) (w7 x))))
(assert (= g6 1))
(assert (forall ((x Int) (y Int)) (= (h6 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v6 x y) (u6 g6 (h6 x y)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (* (v6 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) y)))
(assert (= h5 2))
(assert (= i5 1))
(assert (forall ((x Int)) (= (j5 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u5 x y z) (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v5 x y z) (ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w5 x) (u5 h5 i5 (j5 x)))))
(assert (forall ((x Int)) (= (f4 x) (w5 x))))
(assert (= g4 1))
(assert (forall ((x Int)) (= (h4 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (fast x) (v4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)