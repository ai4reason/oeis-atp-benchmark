;; sequence(s): A176098
;; terms: 0 3 10 21 55 91 187 247 391 551 713 1073 1271 1591 1927 2279 2773 3233 3953 4331
;; small program: loop(loop(loop2((compr((2 - loop(x + x, x, 2)) mod (1 + x), 1 + y) * x) + x, y - 2, 2, 1, x), 1, y), x, 0)
;; fast program: loop(loop2((compr(loop((1 - loop(x + x, x div 2, 1)) mod (1 + x), 1 - (x mod 2), x) - 2, 1 + y) * x) + x, y - 2, 2, 1, x), loop(1, x, x), x)
(set-logic UFNIA)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 () Int)
(declare-fun i2 () Int)
(declare-fun j2 (Int) Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f9 (Int) Int)
(declare-fun g9 (Int) Int)
(declare-fun h9 () Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 (Int) Int)
(declare-fun h8 (Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 (Int Int) Int)
(declare-fun t7 (Int) Int)
(declare-fun u7 (Int) Int)
(declare-fun v7 (Int Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int Int) Int)
(declare-fun h6 () Int)
(declare-fun i6 () Int)
(declare-fun j6 (Int) Int)
(declare-fun u6 (Int Int Int) Int)
(declare-fun v6 (Int Int Int) Int)
(declare-fun w6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun f10 () Int)
(declare-fun g10 (Int) Int)
(declare-fun h10 (Int) Int)
(declare-fun u10 (Int Int) Int)
(declare-fun v10 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f4 x) (+ x x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 2))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (f3 x) (mod (- 2 (v4 x)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 (g3 x y)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (* (v3 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (- y 2))))
(assert (= h2 2))
(assert (= i2 1))
(assert (forall ((x Int)) (= (j2 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 h2 i2 (j2 x)))))
(assert (forall ((x Int)) (= (f1 x) (w2 x))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f9 x) (+ x x))))
(assert (forall ((x Int)) (= (g9 x) (div x 2))))
(assert (= h9 1))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int)) (= (v9 x) (u9 (g9 x) h9))))
(assert (forall ((x Int)) (= (f8 x) (mod (- 1 (v9 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g8 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h8 x) x)))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 (g8 x) (h8 x)))))
(assert (forall ((x Int)) (= (f7 x) (- (v8 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (t7 x) (ite (<= (f7 x) 0) x (t7 (+ x 1))))))
(assert (forall ((x Int)) (= (u7 x) (ite (<= x 0) (t7 0) (t7 (+ (u7 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 (g7 x y)))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ (* (v7 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) (- y 2))))
(assert (= h6 2))
(assert (= i6 1))
(assert (forall ((x Int)) (= (j6 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w6 x) (u6 h6 i6 (j6 x)))))
(assert (forall ((x Int)) (= (f5 x) (w6 x))))
(assert (= f10 1))
(assert (forall ((x Int)) (= (g10 x) x)))
(assert (forall ((x Int)) (= (h10 x) x)))
(assert (forall ((x Int) (y Int)) (= (u10 x y) (ite (<= x 0) y f10))))
(assert (forall ((x Int)) (= (v10 x) (u10 (g10 x) (h10 x)))))
(assert (forall ((x Int)) (= (g5 x) (v10 x))))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) (h5 x)))))
(assert (forall ((x Int)) (= (fast x) (v5 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)