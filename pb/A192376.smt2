;; sequence(s): A192376
;; terms: 1 0 7 16 73 256 975 3616 13521 50432 188247 702512 2621849 9784832 36517535 136285248 508623521 1898208768 7084211623 26438637648
;; small program: loop(loop(loop2(y, (2 * (y + y)) - x, y, 0, 2) - x, y, 1) - x, x, 1)
;; fast program: loop(loop(loop(loop(loop2((2 * (x + x)) - y, x, x - 1, 2, 0), 1, y) - x, x, 1), 1, y) - x, x, 1)
(set-logic UFNIA)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
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
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f2 x y) y)))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (- (* 2 (+ y y)) x))))
(assert (forall ((x Int) (y Int)) (= (h2 x y) y)))
(assert (= i2 0))
(assert (= j2 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w2 x y) (u2 (h2 x y) i2 j2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- (w2 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (- (* 2 (+ x x)) y))))
(assert (forall ((x Int)) (= (g7 x) x)))
(assert (forall ((x Int)) (= (h7 x) (- x 1))))
(assert (= i7 2))
(assert (= j7 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 (h7 x) i7 j7))))
(assert (forall ((x Int)) (= (f6 x) (w7 x))))
(assert (= g6 1))
(assert (forall ((x Int) (y Int)) (= (h6 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v6 x y) (u6 g6 (h6 x y)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (- (v6 x y) x))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (f4 x) (v5 x))))
(assert (= g4 1))
(assert (forall ((x Int) (y Int)) (= (h4 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 g4 (h4 x y)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (- (v4 x y) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (fast x) (v3 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)