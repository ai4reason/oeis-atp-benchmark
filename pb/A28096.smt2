;; sequence(s): A28096
;; terms: 1 31 620 10190 149931 2056881 26907430 340238680 4195278461 50745196931 604662792240 7119407163570 83018865142591 960430934574181 11038161347163050 126162293709144860 1435268577300318321
;; small program: loop(((loop((loop(loop(loop((2 + y) * x, 2, x) - x, y, 1) + (2 * ((2 * (x + x)) + x)), y, 1) + (2 * ((x + x) + x))) + x, y, 1) + x) + x) + x, x, 1)
;; fast program: loop((loop(loop(loop(loop2(((1 + 2) * ((x + x) + y)) + x, (y + y) + y, x, 1, 1), 1, y) + ((((x + x) * 2) + x) * 2), x, 1), 1, y) + x) + ((((x + x) * 2) + x) * 2), x, 1)
(set-logic UFNIA)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
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
(declare-fun f9 (Int Int) Int)
(declare-fun g9 (Int Int) Int)
(declare-fun h9 (Int) Int)
(declare-fun i9 () Int)
(declare-fun j9 () Int)
(declare-fun u9 (Int Int Int) Int)
(declare-fun v9 (Int Int Int) Int)
(declare-fun w9 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 () Int)
(declare-fun h8 (Int Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 () Int)
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
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* (+ 2 y) x))))
(assert (= g4 2))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (- (v4 x) x))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 (g3 x y) h3))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (v3 x y) (* 2 (+ (* 2 (+ x x)) x))))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y) h2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (+ (v2 x y) (* 2 (+ (+ x x) x))) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (v1 x y) x) x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f9 x y) (+ (* (+ 1 2) (+ (+ x x) y)) x))))
(assert (forall ((x Int) (y Int)) (= (g9 x y) (+ (+ y y) y))))
(assert (forall ((x Int)) (= (h9 x) x)))
(assert (= i9 1))
(assert (= j9 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u9 x y z) (ite (<= x 0) y (f9 (u9 (- x 1) y z) (v9 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v9 x y z) (ite (<= x 0) z (g9 (u9 (- x 1) y z) (v9 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w9 x) (u9 (h9 x) i9 j9))))
(assert (forall ((x Int)) (= (f8 x) (w9 x))))
(assert (= g8 1))
(assert (forall ((x Int) (y Int)) (= (h8 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v8 x y) (u8 g8 (h8 x y)))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (+ (v8 x y) (* (+ (* (+ x x) 2) x) 2)))))
(assert (forall ((x Int)) (= (g7 x) x)))
(assert (= h7 1))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) h7))))
(assert (forall ((x Int)) (= (f6 x) (v7 x))))
(assert (= g6 1))
(assert (forall ((x Int) (y Int)) (= (h6 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v6 x y) (u6 g6 (h6 x y)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (+ (+ (v6 x y) x) (* (+ (* (+ x x) 2) x) 2)))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (fast x) (v5 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
