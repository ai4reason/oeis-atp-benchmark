;; sequence(s): A79078
;; terms: 1 2 3 10 21 110 273 1870 5187 43010 150423 1333310 5565651 54665710 239322993 2569288370 12684118629 151588013830 773731236369 10156396926610
;; small program: loop(loop((compr((1 + loop(x * y, x, 1)) mod (1 + x), y) * x) + x, y, 1) div x, x, 1)
;; fast program: loop2((compr(loop((1 - loop(x + x, (x - 1) div 2, 2)) mod (1 + x), 1 - (x mod 2), x) - 2, y) * x) + x, y - 2, x div 2, 1 + (x mod 2), x)
(set-logic UFNIA)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun t2 (Int) Int)
(declare-fun u2 (Int) Int)
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
(declare-fun f7 (Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 () Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun t5 (Int) Int)
(declare-fun u5 (Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun i4 (Int) Int)
(declare-fun j4 (Int) Int)
(declare-fun u4 (Int Int Int) Int)
(declare-fun v4 (Int Int Int) Int)
(declare-fun w4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* x y))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (mod (+ 1 (v3 x)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (t2 x) (ite (<= (f2 x) 0) x (t2 (+ x 1))))))
(assert (forall ((x Int)) (= (u2 x) (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* (v2 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f7 x) (+ x x))))
(assert (forall ((x Int)) (= (g7 x) (div (- x 1) 2))))
(assert (= h7 2))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) h7))))
(assert (forall ((x Int)) (= (f6 x) (mod (- 1 (v7 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g6 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (- (v6 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) y)))
(assert (forall ((x Int)) (= (t5 x) (ite (<= (f5 x) 0) x (t5 (+ x 1))))))
(assert (forall ((x Int)) (= (u5 x) (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 (g5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (* (v5 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) (- y 2))))
(assert (forall ((x Int)) (= (h4 x) (div x 2))))
(assert (forall ((x Int)) (= (i4 x) (+ 1 (mod x 2)))))
(assert (forall ((x Int)) (= (j4 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u4 x y z) (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v4 x y z) (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w4 x) (u4 (h4 x) (i4 x) (j4 x)))))
(assert (forall ((x Int)) (= (fast x) (w4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
