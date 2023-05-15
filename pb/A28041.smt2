;; sequence(s): A28041
;; terms: 1 25 410 5630 70551 839775 9697720 109955260 1232712701 13723263125 152103875430 1681194742890 18549572478451 204440573062075 2251614293669540 24787137412192520 272794189857639801
;; small program: loop(((loop((loop2((loop((2 + y) * x, 2, x) - x) + (y * y), y + y, y, 1, 2) + (2 * ((x + x) + x))) + x, y, 1) + x) + x) + x, x, 1)
;; fast program: loop(loop(((loop((((loop2(x * y, y, x div 2, loop(1 + 2, x mod 2, 1), 1 + (2 * (2 + 2))) + loop2(x * y, y, x, 1, 1 + (2 + (2 * (2 + 2))))) div 2) - loop2(x * y, y, x, 1, 1 + (2 + (2 + 2)))) div 2, 1, 2 + x) div 2) div 2) div 2, 1, y) + (2 * (x + x)), x, 1)
(set-logic UFNIA)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int Int) Int)
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
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun f8 () Int)
(declare-fun g8 (Int) Int)
(declare-fun h8 () Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun i7 (Int) Int)
(declare-fun j7 () Int)
(declare-fun u7 (Int Int Int) Int)
(declare-fun v7 (Int Int Int) Int)
(declare-fun w7 (Int) Int)
(declare-fun f9 (Int Int) Int)
(declare-fun g9 (Int Int) Int)
(declare-fun h9 (Int) Int)
(declare-fun i9 () Int)
(declare-fun j9 () Int)
(declare-fun u9 (Int Int Int) Int)
(declare-fun v9 (Int Int Int) Int)
(declare-fun w9 (Int) Int)
(declare-fun f10 (Int Int) Int)
(declare-fun g10 (Int Int) Int)
(declare-fun h10 (Int) Int)
(declare-fun i10 () Int)
(declare-fun j10 () Int)
(declare-fun u10 (Int Int Int) Int)
(declare-fun v10 (Int Int Int) Int)
(declare-fun w10 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* (+ 2 y) x))))
(assert (= g3 2))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (- (v3 x) x) (* y y)))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (+ y y))))
(assert (forall ((x Int) (y Int)) (= (h2 x y) y)))
(assert (= i2 1))
(assert (= j2 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w2 x y) (u2 (h2 x y) i2 j2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (+ (w2 x y) (* 2 (+ (+ x x) x))) x))))
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
(assert (forall ((x Int) (y Int)) (= (f7 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) y)))
(assert (forall ((x Int)) (= (h7 x) (div x 2))))
(assert (= f8 (+ 1 2)))
(assert (forall ((x Int)) (= (g8 x) (mod x 2))))
(assert (= h8 1))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y f8))))
(assert (forall ((x Int)) (= (v8 x) (u8 (g8 x) h8))))
(assert (forall ((x Int)) (= (i7 x) (v8 x))))
(assert (= j7 (+ 1 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 (h7 x) (i7 x) j7))))
(assert (forall ((x Int) (y Int)) (= (f9 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g9 x y) y)))
(assert (forall ((x Int)) (= (h9 x) x)))
(assert (= i9 1))
(assert (= j9 (+ 1 (+ 2 (* 2 (+ 2 2))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u9 x y z) (ite (<= x 0) y (f9 (u9 (- x 1) y z) (v9 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v9 x y z) (ite (<= x 0) z (g9 (u9 (- x 1) y z) (v9 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w9 x) (u9 (h9 x) i9 j9))))
(assert (forall ((x Int) (y Int)) (= (f10 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g10 x y) y)))
(assert (forall ((x Int)) (= (h10 x) x)))
(assert (= i10 1))
(assert (= j10 (+ 1 (+ 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u10 x y z) (ite (<= x 0) y (f10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v10 x y z) (ite (<= x 0) z (g10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w10 x) (u10 (h10 x) i10 j10))))
(assert (forall ((x Int)) (= (f6 x) (div (- (div (+ (w7 x) (w9 x)) 2) (w10 x)) 2))))
(assert (= g6 1))
(assert (forall ((x Int)) (= (h6 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 g6 (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (div (div (div (v6 x) 2) 2) 2))))
(assert (= g5 1))
(assert (forall ((x Int) (y Int)) (= (h5 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 g5 (h5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (v5 x y) (* 2 (+ x x))))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (v4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
