;; sequence(s): A285961
;; terms: 4 7 12 16 20 23 27 31 36 39 44 48 52 57 60 64 68 71 76 80
;; small program: (loop(loop((if (x mod 2) <= 0 then 2 else x) div 2, y, x) + x, 2 * (x + x), 2) + 2) + x
;; fast program: (compr(((loop((((loop((loop(loop2(x + y, y div 2, 2 + (2 * (2 + 2)), 0, x) mod 2, 1, x div 2) + x) mod 2, 1, x div 2) + x) mod 2) + x) - 1, 2, x) + 1) + x) mod (if x <= 0 then 1 else 2), 1 + x) + 1) + x
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int Int) Int)
(declare-fun h6 () Int)
(declare-fun i6 () Int)
(declare-fun j6 (Int) Int)
(declare-fun u6 (Int Int Int) Int)
(declare-fun v6 (Int Int Int) Int)
(declare-fun w6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun t2 (Int) Int)
(declare-fun u2 (Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (div (ite (<= (mod x 2) 0) 2 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ x x)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 2) x))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) (div y 2))))
(assert (= h6 (+ 2 (* 2 (+ 2 2)))))
(assert (= i6 0))
(assert (forall ((x Int)) (= (j6 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w6 x) (u6 h6 i6 (j6 x)))))
(assert (forall ((x Int)) (= (f5 x) (mod (w6 x) 2))))
(assert (= g5 1))
(assert (forall ((x Int)) (= (h5 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 g5 (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (mod (+ (v5 x) x) 2))))
(assert (= g4 1))
(assert (forall ((x Int)) (= (h4 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (- (+ (mod (+ (v4 x) x) 2) x) 1))))
(assert (= g3 2))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (mod (+ (+ (v3 x) 1) x) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (g2 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t2 x) (ite (<= (f2 x) 0) x (t2 (+ x 1))))))
(assert (forall ((x Int)) (= (u2 x) (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v2 x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
