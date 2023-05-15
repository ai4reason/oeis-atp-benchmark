;; sequence(s): A28193
;; terms: 1 34 733 12810 198261 2836554 38431933 500511850 6327324421 78172168074 948456878733 11341481077290 134023690999381 1568398573483594 18205481984727133 209885052725681130
;; small program: loop(loop(loop(loop((2 * (x + x)) + x, x, loop(x + x, x, 2) - 1), 1, y) + (2 * (2 * (x + x))), y, 1) + (loop((2 + y) * x, 2, x) - x), x, 1)
;; fast program: loop((((((((loop(loop((loop((loop(x + x, x, 2) - 1) * loop2(x * y, y, x, 1, 1 + (2 + 2)), 1, y) + x) + ((((x + x) * 2) + x) * 2), x, 1), 1, y) + x) + x) + x) + x) + x) + x) + x) + x, x, 1)
(set-logic UFNIA)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f10 (Int) Int)
(declare-fun g10 (Int) Int)
(declare-fun h10 () Int)
(declare-fun u10 (Int Int) Int)
(declare-fun v10 (Int) Int)
(declare-fun f11 (Int Int) Int)
(declare-fun g11 (Int Int) Int)
(declare-fun h11 (Int) Int)
(declare-fun i11 () Int)
(declare-fun j11 () Int)
(declare-fun u11 (Int Int Int) Int)
(declare-fun v11 (Int Int Int) Int)
(declare-fun w11 (Int) Int)
(declare-fun f9 (Int) Int)
(declare-fun g9 () Int)
(declare-fun h9 (Int Int) Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int Int) Int)
(declare-fun f8 (Int Int) Int)
(declare-fun g8 (Int) Int)
(declare-fun h8 () Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 () Int)
(declare-fun h7 (Int Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f3 x) (+ (* 2 (+ x x)) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (f4 x) (+ x x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 2))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (h3 x) (- (v4 x) 1))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (v3 x))))
(assert (= g2 1))
(assert (forall ((x Int) (y Int)) (= (h2 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 g2 (h2 x y)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (v2 x y) (* 2 (* 2 (+ x x)))))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (* (+ 2 y) x))))
(assert (= g5 2))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 g5 (h5 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) (- (v5 x) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f10 x) (+ x x))))
(assert (forall ((x Int)) (= (g10 x) x)))
(assert (= h10 2))
(assert (forall ((x Int) (y Int)) (= (u10 x y) (ite (<= x 0) y (f10 (u10 (- x 1) y))))))
(assert (forall ((x Int)) (= (v10 x) (u10 (g10 x) h10))))
(assert (forall ((x Int) (y Int)) (= (f11 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g11 x y) y)))
(assert (forall ((x Int)) (= (h11 x) x)))
(assert (= i11 1))
(assert (= j11 (+ 1 (+ 2 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u11 x y z) (ite (<= x 0) y (f11 (u11 (- x 1) y z) (v11 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v11 x y z) (ite (<= x 0) z (g11 (u11 (- x 1) y z) (v11 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w11 x) (u11 (h11 x) i11 j11))))
(assert (forall ((x Int)) (= (f9 x) (* (- (v10 x) 1) (w11 x)))))
(assert (= g9 1))
(assert (forall ((x Int) (y Int)) (= (h9 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v9 x y) (u9 g9 (h9 x y)))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (+ (+ (v9 x y) x) (* (+ (* (+ x x) 2) x) 2)))))
(assert (forall ((x Int)) (= (g8 x) x)))
(assert (= h8 1))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v8 x) (u8 (g8 x) h8))))
(assert (forall ((x Int)) (= (f7 x) (v8 x))))
(assert (= g7 1))
(assert (forall ((x Int) (y Int)) (= (h7 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 g7 (h7 x y)))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ (+ (+ (+ (+ (+ (+ (+ (v7 x y) x) x) x) x) x) x) x) x))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (= h6 1))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (fast x) (v6 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
