;; sequence(s): A28087
;; terms: 1 31 625 10435 157081 2218891 30058465 395576995 5099030761 64729573051 812287789105 10103508011155 124806994586041 1533359039348011 18757216238876545 228656612889142915
;; small program: loop(loop(loop2(((2 * (y * y)) - y) + x, y + y, x, 1, 2) * loop((x + x) + x, x, 1), 1, y) + (2 * ((2 * (x + x)) + x)), x, 1)
;; fast program: loop(loop(((loop((x * x) + x, 1, loop(2 + (x + x), x, 2)) div 2) div (1 + 2)) * loop2(x * y, y, x, 1, 1 + 2), 1, y) + (2 * ((2 * (x + x)) + x)), x, 1)
(set-logic UFNIA)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
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
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 () Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f8 (Int Int) Int)
(declare-fun g8 (Int Int) Int)
(declare-fun h8 (Int) Int)
(declare-fun i8 () Int)
(declare-fun j8 () Int)
(declare-fun u8 (Int Int Int) Int)
(declare-fun v8 (Int Int Int) Int)
(declare-fun w8 (Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (- (* 2 (* y y)) y) x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (+ y y))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (= i2 1))
(assert (= j2 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 j2))))
(assert (forall ((x Int)) (= (f3 x) (+ (+ x x) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f1 x) (* (w2 x) (v3 x)))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) (* 2 (+ (* 2 (+ x x)) x))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f6 x) (+ (* x x) x))))
(assert (= g6 1))
(assert (forall ((x Int)) (= (f7 x) (+ 2 (+ x x)))))
(assert (forall ((x Int)) (= (g7 x) x)))
(assert (= h7 2))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) h7))))
(assert (forall ((x Int)) (= (h6 x) (v7 x))))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 g6 (h6 x)))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g8 x y) y)))
(assert (forall ((x Int)) (= (h8 x) x)))
(assert (= i8 1))
(assert (= j8 (+ 1 2)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u8 x y z) (ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v8 x y z) (ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w8 x) (u8 (h8 x) i8 j8))))
(assert (forall ((x Int)) (= (f5 x) (* (div (div (v6 x) 2) (+ 1 2)) (w8 x)))))
(assert (= g5 1))
(assert (forall ((x Int) (y Int)) (= (h5 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 g5 (h5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (v5 x y) (* 2 (+ (* 2 (+ x x)) x))))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (v4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
