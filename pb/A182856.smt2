;; sequence(s): A182856
;; terms: 1 2 60 1801800 11657093261814000 7167827541370578634694420017740000 291943326350524088652207164949980988754136887856059678357800000
;; small program: loop(loop(loop(loop((compr((1 + loop(x * y, x, 1)) mod (1 + x), y) + 1) * x, x, 1), 1, ((x * x) + x) div 2), 1, y) * x, x, 1)
;; fast program: loop(loop(loop(loop((compr(loop((1 - loop(x + x, (x - 1) div 2, 2)) mod (1 + x), 1 - (x mod 2), x) - 2, y) + 1) * x, x, 1), 1, ((x * x) + x) div 2), 1, y) * x, x, 1)
(set-logic UFNIA)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun t4 (Int) Int)
(declare-fun u4 (Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
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
(declare-fun f12 (Int) Int)
(declare-fun g12 (Int) Int)
(declare-fun h12 () Int)
(declare-fun u12 (Int Int) Int)
(declare-fun v12 (Int) Int)
(declare-fun f11 (Int) Int)
(declare-fun g11 (Int) Int)
(declare-fun h11 (Int) Int)
(declare-fun u11 (Int Int) Int)
(declare-fun v11 (Int) Int)
(declare-fun f10 (Int) Int)
(declare-fun g10 (Int Int) Int)
(declare-fun t10 (Int) Int)
(declare-fun u10 (Int) Int)
(declare-fun v10 (Int Int) Int)
(declare-fun f9 (Int Int) Int)
(declare-fun g9 (Int) Int)
(declare-fun h9 () Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 () Int)
(declare-fun h8 (Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f5 x y) (* x y))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (f4 x) (mod (+ 1 (v5 x)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) y)))
(assert (forall ((x Int)) (= (t4 x) (ite (<= (f4 x) 0) x (t4 (+ x 1))))))
(assert (forall ((x Int)) (= (u4 x) (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 (g4 x y)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* (+ (v4 x y) 1) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (v3 x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (div (+ (* x x) x) 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (v2 x))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f12 x) (+ x x))))
(assert (forall ((x Int)) (= (g12 x) (div (- x 1) 2))))
(assert (= h12 2))
(assert (forall ((x Int) (y Int)) (= (u12 x y) (ite (<= x 0) y (f12 (u12 (- x 1) y))))))
(assert (forall ((x Int)) (= (v12 x) (u12 (g12 x) h12))))
(assert (forall ((x Int)) (= (f11 x) (mod (- 1 (v12 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g11 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h11 x) x)))
(assert (forall ((x Int) (y Int)) (= (u11 x y) (ite (<= x 0) y (f11 (u11 (- x 1) y))))))
(assert (forall ((x Int)) (= (v11 x) (u11 (g11 x) (h11 x)))))
(assert (forall ((x Int)) (= (f10 x) (- (v11 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g10 x y) y)))
(assert (forall ((x Int)) (= (t10 x) (ite (<= (f10 x) 0) x (t10 (+ x 1))))))
(assert (forall ((x Int)) (= (u10 x) (ite (<= x 0) (t10 0) (t10 (+ (u10 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v10 x y) (u10 (g10 x y)))))
(assert (forall ((x Int) (y Int)) (= (f9 x y) (* (+ (v10 x y) 1) x))))
(assert (forall ((x Int)) (= (g9 x) x)))
(assert (= h9 1))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v9 x) (u9 (g9 x) h9))))
(assert (forall ((x Int)) (= (f8 x) (v9 x))))
(assert (= g8 1))
(assert (forall ((x Int)) (= (h8 x) (div (+ (* x x) x) 2))))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 g8 (h8 x)))))
(assert (forall ((x Int)) (= (f7 x) (v8 x))))
(assert (= g7 1))
(assert (forall ((x Int) (y Int)) (= (h7 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 g7 (h7 x y)))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (* (v7 x y) x))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (= h6 1))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (fast x) (v6 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
