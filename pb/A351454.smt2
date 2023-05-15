;; sequence(s): A351454-A351460
;; terms: 1 2 3 2 4 3 5 2 6 4 7 3 8 5 9 2 10 6 11 4
;; small program: (loop(x div (1 + (x mod 2)), x, x) div 2) + (if x <= 0 then 1 else 2)
;; fast program: loop(loop(loop(loop(loop(loop(loop(loop(1 + loop(loop(x div 2, x mod 2, x), loop(2 + 2, x mod 2, 0), x), 1, x div 2), x mod 2, x) div 2, x mod 2, x div 2), x mod 2, x div 2), x mod 2, x div 2), x mod 2, x div 2), x mod 2, x div 2), x mod 2, x div 2) + (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f10 (Int) Int)
(declare-fun g10 (Int) Int)
(declare-fun h10 (Int) Int)
(declare-fun u10 (Int Int) Int)
(declare-fun v10 (Int) Int)
(declare-fun f9 (Int) Int)
(declare-fun f11 () Int)
(declare-fun g11 (Int) Int)
(declare-fun h11 () Int)
(declare-fun u11 (Int Int) Int)
(declare-fun v11 (Int) Int)
(declare-fun g9 (Int) Int)
(declare-fun h9 (Int) Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 () Int)
(declare-fun h8 (Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 (mod x 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (f10 x) (div x 2))))
(assert (forall ((x Int)) (= (g10 x) (mod x 2))))
(assert (forall ((x Int)) (= (h10 x) x)))
(assert (forall ((x Int) (y Int)) (= (u10 x y) (ite (<= x 0) y (f10 (u10 (- x 1) y))))))
(assert (forall ((x Int)) (= (v10 x) (u10 (g10 x) (h10 x)))))
(assert (forall ((x Int)) (= (f9 x) (v10 x))))
(assert (= f11 (+ 2 2)))
(assert (forall ((x Int)) (= (g11 x) (mod x 2))))
(assert (= h11 0))
(assert (forall ((x Int) (y Int)) (= (u11 x y) (ite (<= x 0) y f11))))
(assert (forall ((x Int)) (= (v11 x) (u11 (g11 x) h11))))
(assert (forall ((x Int)) (= (g9 x) (v11 x))))
(assert (forall ((x Int)) (= (h9 x) x)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int)) (= (v9 x) (u9 (g9 x) (h9 x)))))
(assert (forall ((x Int)) (= (f8 x) (+ 1 (v9 x)))))
(assert (= g8 1))
(assert (forall ((x Int)) (= (h8 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 g8 (h8 x)))))
(assert (forall ((x Int)) (= (f7 x) (v8 x))))
(assert (forall ((x Int)) (= (g7 x) (mod x 2))))
(assert (forall ((x Int)) (= (h7 x) x)))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) (h7 x)))))
(assert (forall ((x Int)) (= (f6 x) (div (v7 x) 2))))
(assert (forall ((x Int)) (= (g6 x) (mod x 2))))
(assert (forall ((x Int)) (= (h6 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (v6 x))))
(assert (forall ((x Int)) (= (g5 x) (mod x 2))))
(assert (forall ((x Int)) (= (h5 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (v5 x))))
(assert (forall ((x Int)) (= (g4 x) (mod x 2))))
(assert (forall ((x Int)) (= (h4 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (v4 x))))
(assert (forall ((x Int)) (= (g3 x) (mod x 2))))
(assert (forall ((x Int)) (= (h3 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (v3 x))))
(assert (forall ((x Int)) (= (g2 x) (mod x 2))))
(assert (forall ((x Int)) (= (h2 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (v2 x))))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (forall ((x Int)) (= (h1 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v1 x) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
