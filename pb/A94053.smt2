;; sequence(s): A94053
;; terms: 0 1 0 2 2 0 3 4 3 0 4 6 6 4 0 5 8 9 8 5
;; small program: loop(loop(loop(loop((if x <= 0 then 0 else (1 + y)) - x, x, x), 1, 1 + (x + x)) - x, 1, y) + x, x, 0) - x
;; fast program: loop(loop(loop2(loop(loop2(loop(x + y, x, y) div x, y, 1 + 2, 2 + (2 + 2), x), 1, y) * x, y, 2, 1, x), 1, y) + x, x, 0) mod (2 + x)
(set-logic UFNIA)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
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
(declare-fun f9 (Int Int) Int)
(declare-fun g9 (Int) Int)
(declare-fun h9 (Int Int) Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int Int) Int)
(declare-fun f8 (Int Int) Int)
(declare-fun g8 (Int Int) Int)
(declare-fun h8 () Int)
(declare-fun i8 () Int)
(declare-fun j8 (Int) Int)
(declare-fun u8 (Int Int Int) Int)
(declare-fun v8 (Int Int Int) Int)
(declare-fun w8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 () Int)
(declare-fun h7 (Int Int) Int)
(declare-fun u7 (Int Int) Int)
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
(declare-fun g5 () Int)
(declare-fun h5 (Int Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (- (ite (<= x 0) 0 (+ 1 y)) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (v3 x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ 1 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (- (v2 x) x))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int) (y Int)) (= (f9 x y) (+ x y))))
(assert (forall ((x Int)) (= (g9 x) x)))
(assert (forall ((x Int) (y Int)) (= (h9 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v9 x y) (u9 (g9 x) (h9 x y)))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (div (v9 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g8 x y) y)))
(assert (= h8 (+ 1 2)))
(assert (= i8 (+ 2 (+ 2 2))))
(assert (forall ((x Int)) (= (j8 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u8 x y z) (ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v8 x y z) (ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w8 x) (u8 h8 i8 (j8 x)))))
(assert (forall ((x Int)) (= (f7 x) (w8 x))))
(assert (= g7 1))
(assert (forall ((x Int) (y Int)) (= (h7 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 g7 (h7 x y)))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (* (v7 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) y)))
(assert (= h6 2))
(assert (= i6 1))
(assert (forall ((x Int)) (= (j6 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w6 x) (u6 h6 i6 (j6 x)))))
(assert (forall ((x Int)) (= (f5 x) (w6 x))))
(assert (= g5 1))
(assert (forall ((x Int) (y Int)) (= (h5 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 g5 (h5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (v5 x y) x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 0))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (mod (v4 x) (+ 2 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
