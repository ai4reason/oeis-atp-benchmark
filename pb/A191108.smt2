;; sequence(s): A191108
;; terms: 1 5 13 17 37 41 49 53 109 113 121 125 145 149 157 161 325 329 337 341
;; small program: (compr(loop(if (x mod 2) <= 0 then (x div (1 + 2)) else 1, (1 + 2) + x, x), x) * 2) + 1
;; fast program: (((loop(((((loop((((((loop(((((loop((((((loop(((((loop2(x - y, y div 2, x, x, x) + x) * (1 + 2)) + 1) - x) - x, 1, x div 2) + x) * (1 + 2)) - 1) - 2) - x) - x, 1, x div 2) + x) * (1 + 2)) + 1) - x) - x, 1, x div 2) + x) * (1 + 2)) - 1) - 2) - x) - x, 1, x div 2) + x) * (1 + 2)) + 1) - x) - x, 1, x div 2) + x) * (2 + 2)) - 1) - 2
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun i7 (Int) Int)
(declare-fun j7 (Int) Int)
(declare-fun u7 (Int Int Int) Int)
(declare-fun v7 (Int Int Int) Int)
(declare-fun w7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
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
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (ite (<= (mod x 2) 0) (div x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (g1 x) (+ (+ 1 2) x))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (v1 x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) 2) 1))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (- x y))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) (div y 2))))
(assert (forall ((x Int)) (= (h7 x) x)))
(assert (forall ((x Int)) (= (i7 x) x)))
(assert (forall ((x Int)) (= (j7 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 (h7 x) (i7 x) (j7 x)))))
(assert (forall ((x Int)) (= (f6 x) (- (- (+ (* (+ (w7 x) x) (+ 1 2)) 1) x) x))))
(assert (= g6 1))
(assert (forall ((x Int)) (= (h6 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 g6 (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (- (- (- (- (* (+ (v6 x) x) (+ 1 2)) 1) 2) x) x))))
(assert (= g5 1))
(assert (forall ((x Int)) (= (h5 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 g5 (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (- (- (+ (* (+ (v5 x) x) (+ 1 2)) 1) x) x))))
(assert (= g4 1))
(assert (forall ((x Int)) (= (h4 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (- (- (- (- (* (+ (v4 x) x) (+ 1 2)) 1) 2) x) x))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (- (- (+ (* (+ (v3 x) x) (+ 1 2)) 1) x) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (- (* (+ (v2 x) x) (+ 2 2)) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
