;; sequence(s): A116082
;; terms: 0 1 3 7 15 31 63 127 254 501 967 1815 3301 5811 9907 16383 26332 41225 63003 94183
;; small program: loop(loop(loop(loop(loop(loop(x + y, y, x), y - 2, x) + y, y - 2, x), y, x) + y, y - 1, x), x, x)
;; fast program: loop(loop(loop(loop(loop(loop(x + y, y, x), y - 1, x) + y, y - 2, x) + y, y, x), y - 2, x) + y, x, 0)
(set-logic UFNIA)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f11 (Int Int) Int)
(declare-fun g11 (Int Int) Int)
(declare-fun h11 (Int) Int)
(declare-fun u11 (Int Int) Int)
(declare-fun v11 (Int Int) Int)
(declare-fun f10 (Int Int) Int)
(declare-fun g10 (Int Int) Int)
(declare-fun h10 (Int) Int)
(declare-fun u10 (Int Int) Int)
(declare-fun v10 (Int Int) Int)
(declare-fun f9 (Int Int) Int)
(declare-fun g9 (Int Int) Int)
(declare-fun h9 (Int) Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int Int) Int)
(declare-fun f8 (Int Int) Int)
(declare-fun g8 (Int Int) Int)
(declare-fun h8 (Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f5 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) y)))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 (g5 x y) (h5 x)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (v5 x y))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) (- y 2))))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 (g4 x y) (h4 x)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (v4 x y) y))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) (- y 2))))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 (g3 x y) (h3 x)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (v3 x y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y) (h2 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (v2 x y) y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (- y 1))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f11 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g11 x y) y)))
(assert (forall ((x Int)) (= (h11 x) x)))
(assert (forall ((x Int) (y Int)) (= (u11 x y) (ite (<= x 0) y (f11 (u11 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v11 x y) (u11 (g11 x y) (h11 x)))))
(assert (forall ((x Int) (y Int)) (= (f10 x y) (v11 x y))))
(assert (forall ((x Int) (y Int)) (= (g10 x y) (- y 1))))
(assert (forall ((x Int)) (= (h10 x) x)))
(assert (forall ((x Int) (y Int)) (= (u10 x y) (ite (<= x 0) y (f10 (u10 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v10 x y) (u10 (g10 x y) (h10 x)))))
(assert (forall ((x Int) (y Int)) (= (f9 x y) (+ (v10 x y) y))))
(assert (forall ((x Int) (y Int)) (= (g9 x y) (- y 2))))
(assert (forall ((x Int)) (= (h9 x) x)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v9 x y) (u9 (g9 x y) (h9 x)))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (+ (v9 x y) y))))
(assert (forall ((x Int) (y Int)) (= (g8 x y) y)))
(assert (forall ((x Int)) (= (h8 x) x)))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v8 x y) (u8 (g8 x y) (h8 x)))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (v8 x y))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) (- y 2))))
(assert (forall ((x Int)) (= (h7 x) x)))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 (g7 x y) (h7 x)))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ (v7 x y) y))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (= h6 0))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (fast x) (v6 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
