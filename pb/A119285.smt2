;; sequence(s): A119285
;; terms: 0 ~1 0 ~16 65 ~560 3536 ~25025 169456 ~1166880 7983745 ~54758496 375223200 ~2572072321 17628580320 ~120829829680 828175410881 ~5676410656400 38906666170736 ~266670338968385
;; small program: loop(loop(loop(x * x, 2, loop2(x + y, x, x, 0, 1)) * loop(0 - x, x, 1), 1, y) + x, x, 0)
;; fast program: loop(loop(loop(0 - x, x mod 2, loop(x * x, 2, loop2(x + y, x, x, 0, 1))), 1, y) + x, x, 0)
(set-logic UFNIA)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun i3 () Int)
(declare-fun j3 () Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
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
(declare-fun f7 (Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 () Int)
(declare-fun f9 (Int Int) Int)
(declare-fun g9 (Int) Int)
(declare-fun h9 (Int) Int)
(declare-fun i9 () Int)
(declare-fun j9 () Int)
(declare-fun u9 (Int Int Int) Int)
(declare-fun v9 (Int Int Int) Int)
(declare-fun w9 (Int) Int)
(declare-fun h8 (Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
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
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 2))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ x y))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (= i3 0))
(assert (= j3 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) i3 j3))))
(assert (forall ((x Int)) (= (h2 x) (w3 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f4 x) (- 0 x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (f1 x) (* (v2 x) (v4 x)))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f7 x) (- 0 x))))
(assert (forall ((x Int)) (= (g7 x) (mod x 2))))
(assert (forall ((x Int)) (= (f8 x) (* x x))))
(assert (= g8 2))
(assert (forall ((x Int) (y Int)) (= (f9 x y) (+ x y))))
(assert (forall ((x Int)) (= (g9 x) x)))
(assert (forall ((x Int)) (= (h9 x) x)))
(assert (= i9 0))
(assert (= j9 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u9 x y z) (ite (<= x 0) y (f9 (u9 (- x 1) y z) (v9 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v9 x y z) (ite (<= x 0) z (g9 (u9 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w9 x) (u9 (h9 x) i9 j9))))
(assert (forall ((x Int)) (= (h8 x) (w9 x))))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 g8 (h8 x)))))
(assert (forall ((x Int)) (= (h7 x) (v8 x))))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) (h7 x)))))
(assert (forall ((x Int)) (= (f6 x) (v7 x))))
(assert (= g6 1))
(assert (forall ((x Int) (y Int)) (= (h6 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v6 x y) (u6 g6 (h6 x y)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (+ (v6 x y) x))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 0))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (fast x) (v5 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
