;; sequence(s): A175073
;; terms: 3 11 17 23 29 37 41 47 53 59 67 71 79 83 89 97 101 107 113 127
;; small program: compr((((loop(loop((loop((((if (((1 + loop(x + x, x div 2, 1)) mod (1 + x)) - 2) <= 0 then 1 else x) + x) mod 2) + (x mod 2), 1, x + x) + 1) mod 2, 1, x div 2) + x, 2, x) * 2) + 1) + x) mod (1 + x), 1 + x) + 2
;; fast program: compr(((loop((((((((loop((((if (((1 + loop(x + x, x, 1)) mod (1 + (x + x))) - 2) <= 0 then 1 else 2) + x) + x) mod (if x <= 0 then 1 else 2), 1, x div 2) + x) mod 2) - (x mod 2)) + 1) + x) mod 2) + (x mod 2)) + x, 2, x) + 1) + x) mod 2, x + x) + 2
(set-logic UFNIA)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
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
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 (Int) Int)
(declare-fun h8 () Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 () Int)
(declare-fun h7 (Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun t5 (Int) Int)
(declare-fun u5 (Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f4 x) (+ x x))))
(assert (forall ((x Int)) (= (g4 x) (div x 2))))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (f3 x) (+ (mod (+ (ite (<= (- (mod (+ 1 (v4 x)) (+ 1 x)) 2) 0) 1 x) x) 2) (mod x 2)))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (mod (+ (v3 x) 1) 2))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (+ (v2 x) x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (mod (+ (+ (* (v1 x) 2) 1) x) (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int)) (= (f8 x) (+ x x))))
(assert (forall ((x Int)) (= (g8 x) x)))
(assert (= h8 1))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 (g8 x) h8))))
(assert (forall ((x Int)) (= (f7 x) (mod (+ (+ (ite (<= (- (mod (+ 1 (v8 x)) (+ 1 (+ x x))) 2) 0) 1 2) x) x) (ite (<= x 0) 1 2)))))
(assert (= g7 1))
(assert (forall ((x Int)) (= (h7 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 g7 (h7 x)))))
(assert (forall ((x Int)) (= (f6 x) (+ (+ (mod (+ (+ (- (mod (+ (v7 x) x) 2) (mod x 2)) 1) x) 2) (mod x 2)) x))))
(assert (= g6 2))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 g6 (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (mod (+ (+ (v6 x) 1) x) 2))))
(assert (forall ((x Int)) (= (g5 x) (+ x x))))
(assert (forall ((x Int)) (= (t5 x) (ite (<= (f5 x) 0) x (t5 (+ x 1))))))
(assert (forall ((x Int)) (= (u5 x) (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v5 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
