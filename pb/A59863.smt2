;; sequence(s): A59863
;; terms: 1 1 1 3 21 189 2457 36855 700245 17506125 472665375 15597957375 577124422875 22507852492125 967837657161375 47424045200907375 2608322486049905625 148674381704844620625 9366486047405211099375 627554565176149143658125
;; small program: loop(loop((compr((1 + loop(x + x, x, x)) mod (1 + x), 1 + x) - 1) - 2, 1, y) * x, x - 1, 1)
;; fast program: loop(loop((compr(loop((1 - loop(x + x, (x - 1) div 2, 2)) mod (1 + x), 1 - (x mod 2), x) - 2, (1 + 2) + x) - 1) - 2, 1, y) * x, x - 2, 1)
(set-logic UFNIA)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun t2 (Int) Int)
(declare-fun u2 (Int) Int)
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
(declare-fun f8 (Int) Int)
(declare-fun g8 (Int) Int)
(declare-fun h8 () Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun t6 (Int) Int)
(declare-fun u6 (Int) Int)
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
(assert (forall ((x Int)) (= (f3 x) (+ x x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (mod (+ 1 (v3 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g2 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t2 x) (ite (<= (f2 x) 0) x (t2 (+ x 1))))))
(assert (forall ((x Int)) (= (u2 x) (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x)))))
(assert (forall ((x Int)) (= (f1 x) (- (- (v2 x) 1) 2))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f8 x) (+ x x))))
(assert (forall ((x Int)) (= (g8 x) (div (- x 1) 2))))
(assert (= h8 2))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 (g8 x) h8))))
(assert (forall ((x Int)) (= (f7 x) (mod (- 1 (v8 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g7 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h7 x) x)))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) (h7 x)))))
(assert (forall ((x Int)) (= (f6 x) (- (v7 x) 2))))
(assert (forall ((x Int)) (= (g6 x) (+ (+ 1 2) x))))
(assert (forall ((x Int)) (= (t6 x) (ite (<= (f6 x) 0) x (t6 (+ x 1))))))
(assert (forall ((x Int)) (= (u6 x) (ite (<= x 0) (t6 0) (t6 (+ (u6 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x)))))
(assert (forall ((x Int)) (= (f5 x) (- (- (v6 x) 1) 2))))
(assert (= g5 1))
(assert (forall ((x Int) (y Int)) (= (h5 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 g5 (h5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* (v5 x y) x))))
(assert (forall ((x Int)) (= (g4 x) (- x 2))))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (v4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
