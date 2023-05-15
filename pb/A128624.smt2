;; sequence(s): A128624
;; terms: 1 4 12 24 45 72 112 160 225 300 396 504 637 784 960 1152 1377 1620 1900 2200
;; small program: (1 + loop((y div 2) + x, x, x)) * (1 + x)
;; fast program: (1 + (((x * x) div (2 + 2)) + x)) * (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (v0 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ (div (* x x) (+ 2 2)) x)) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)