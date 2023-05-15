;; sequence(s): A236226
;; terms: 262144 387682633 3815084948258 1632228682858707 5561549542175090188 118016956494132483317 14181101408561857474326 118308451706473099007167 3362459361601721384307536 213819743726773841714612697 912873363725818880253782938
;; small program: loop(loop(loop2((compr((1 + loop(x * y, x, 1)) mod (1 + x), y) * x) + x, y, 2 + loop(x * x, 2, 2), 1, x), 1, y) + x, 1 + x, 0)
;; fast program: loop(loop(loop2(loop(loop2((compr(loop((1 - loop(x + x, (x - 1) div 2, 2)) mod (1 + x), 1 - (x mod 2), x) - 2, 1 + y) + 1) * ((((x * x) * x) * x) * x), y, 2, 1, x - 1), 1, y) * x, y, 1 + 2, 1, x), 1, y) + x, 1 + x, 0)
(set-logic UFNIA)
(declare-fun f4 (Int Int) Int)
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
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 () Int)
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
(declare-fun f13 (Int) Int)
(declare-fun g13 (Int) Int)
(declare-fun h13 () Int)
(declare-fun u13 (Int Int) Int)
(declare-fun v13 (Int) Int)
(declare-fun f12 (Int) Int)
(declare-fun g12 (Int) Int)
(declare-fun h12 (Int) Int)
(declare-fun u12 (Int Int) Int)
(declare-fun v12 (Int) Int)
(declare-fun f11 (Int) Int)
(declare-fun g11 (Int Int) Int)
(declare-fun t11 (Int) Int)
(declare-fun u11 (Int) Int)
(declare-fun v11 (Int Int) Int)
(declare-fun f10 (Int Int) Int)
(declare-fun g10 (Int Int) Int)
(declare-fun h10 () Int)
(declare-fun i10 () Int)
(declare-fun j10 (Int) Int)
(declare-fun u10 (Int Int Int) Int)
(declare-fun v10 (Int Int Int) Int)
(declare-fun w10 (Int) Int)
(declare-fun f9 (Int) Int)
(declare-fun g9 () Int)
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
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* x y))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (f3 x) (mod (+ 1 (v4 x)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 (g3 x y)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (* (v3 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (f5 x) (* x x))))
(assert (= g5 2))
(assert (= h5 2))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (= v5 (u5 g5 h5)))
(assert (= h2 (+ 2 v5)))
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f13 x) (+ x x))))
(assert (forall ((x Int)) (= (g13 x) (div (- x 1) 2))))
(assert (= h13 2))
(assert (forall ((x Int) (y Int)) (= (u13 x y) (ite (<= x 0) y (f13 (u13 (- x 1) y))))))
(assert (forall ((x Int)) (= (v13 x) (u13 (g13 x) h13))))
(assert (forall ((x Int)) (= (f12 x) (mod (- 1 (v13 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g12 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h12 x) x)))
(assert (forall ((x Int) (y Int)) (= (u12 x y) (ite (<= x 0) y (f12 (u12 (- x 1) y))))))
(assert (forall ((x Int)) (= (v12 x) (u12 (g12 x) (h12 x)))))
(assert (forall ((x Int)) (= (f11 x) (- (v12 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g11 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (t11 x) (ite (<= (f11 x) 0) x (t11 (+ x 1))))))
(assert (forall ((x Int)) (= (u11 x) (ite (<= x 0) (t11 0) (t11 (+ (u11 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v11 x y) (u11 (g11 x y)))))
(assert (forall ((x Int) (y Int)) (= (f10 x y) (* (+ (v11 x y) 1) (* (* (* (* x x) x) x) x)))))
(assert (forall ((x Int) (y Int)) (= (g10 x y) y)))
(assert (= h10 2))
(assert (= i10 1))
(assert (forall ((x Int)) (= (j10 x) (- x 1))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u10 x y z) (ite (<= x 0) y (f10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v10 x y z) (ite (<= x 0) z (g10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w10 x) (u10 h10 i10 (j10 x)))))
(assert (forall ((x Int)) (= (f9 x) (w10 x))))
(assert (= g9 1))
(assert (forall ((x Int) (y Int)) (= (h9 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v9 x y) (u9 g9 (h9 x y)))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (* (v9 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g8 x y) y)))
(assert (= h8 (+ 1 2)))
(assert (= i8 1))
(assert (forall ((x Int)) (= (j8 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u8 x y z) (ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v8 x y z) (ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w8 x) (u8 h8 i8 (j8 x)))))
(assert (forall ((x Int)) (= (f7 x) (w8 x))))
(assert (= g7 1))
(assert (forall ((x Int) (y Int)) (= (h7 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 g7 (h7 x y)))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ (v7 x y) x))))
(assert (forall ((x Int)) (= (g6 x) (+ 1 x))))
(assert (= h6 0))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (fast x) (v6 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
