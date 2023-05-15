;; sequence(s): A47336
;; terms: 1 6 8 13 15 20 22 27 29 34 36 41 43 48 50 55 57 62 64 69
;; small program: 1 + loop2(y - x, x, 2 + 2, x, x div 2)
;; fast program: 1 + ((((1 + 2) * (x - (x div 2))) + x) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 2 2)))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (forall ((x Int)) (= (j0 x) (div x 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (w0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (+ (* (+ 1 2) (- x (div x 2))) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)