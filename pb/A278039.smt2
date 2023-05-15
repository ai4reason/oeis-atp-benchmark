;; sequence(s): A278039
;; terms: 0 2 4 6 7 9 11 13 15 17 19 20 22 24 26 28 30 31 33 35
;; small program: loop(compr(compr(loop2(loop(if ((1 + x) mod (2 * (2 + 2))) <= 0 then 1 else 0, 1, y) + x, y div 2, x, 0, x), x) mod 2, y), x, 0)
;; fast program: loop(((compr(loop2(loop(if ((1 + x) mod (2 * (2 + 2))) <= 0 then 1 else 0, 1, y) + x, y div 2, x, 0, x), x) mod 2) + 1) + x, x, 1) - 1
(set-logic UFNIA)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun i3 () Int)
(declare-fun j3 (Int) Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun t2 (Int) Int)
(declare-fun u2 (Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun t1 (Int) Int)
(declare-fun u1 (Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 () Int)
(declare-fun h8 (Int Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun i7 () Int)
(declare-fun j7 (Int) Int)
(declare-fun u7 (Int Int Int) Int)
(declare-fun v7 (Int Int Int) Int)
(declare-fun w7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun t6 (Int) Int)
(declare-fun u6 (Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f4 x) (ite (<= (mod (+ 1 x) (* 2 (+ 2 2))) 0) 1 0))))
(assert (= g4 1))
(assert (forall ((x Int) (y Int)) (= (h4 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 g4 (h4 x y)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (v4 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) (div y 2))))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (= i3 0))
(assert (forall ((x Int)) (= (j3 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) i3 (j3 x)))))
(assert (forall ((x Int)) (= (f2 x) (w3 x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int)) (= (t2 x) (ite (<= (f2 x) 0) x (t2 (+ x 1))))))
(assert (forall ((x Int)) (= (u2 x) (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x)))))
(assert (forall ((x Int)) (= (f1 x) (mod (v2 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (t1 x) (ite (<= (f1 x) 0) x (t1 (+ x 1))))))
(assert (forall ((x Int)) (= (u1 x) (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f8 x) (ite (<= (mod (+ 1 x) (* 2 (+ 2 2))) 0) 1 0))))
(assert (= g8 1))
(assert (forall ((x Int) (y Int)) (= (h8 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v8 x y) (u8 g8 (h8 x y)))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (+ (v8 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) (div y 2))))
(assert (forall ((x Int)) (= (h7 x) x)))
(assert (= i7 0))
(assert (forall ((x Int)) (= (j7 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 (h7 x) i7 (j7 x)))))
(assert (forall ((x Int)) (= (f6 x) (w7 x))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (forall ((x Int)) (= (t6 x) (ite (<= (f6 x) 0) x (t6 (+ x 1))))))
(assert (forall ((x Int)) (= (u6 x) (ite (<= x 0) (t6 0) (t6 (+ (u6 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x)))))
(assert (forall ((x Int)) (= (f5 x) (+ (+ (mod (v6 x) 2) 1) x))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (fast x) (- (v5 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
