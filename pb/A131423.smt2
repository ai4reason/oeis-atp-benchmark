;; sequence(s): A131423-A143371
;; terms: 1 8 25 56 105 176 273 400 561 760 1001 1288 1625 2016 2465 2976 3553 4200 4921 5720
;; small program: 1 + loop((2 * ((2 + y) * y)) + x, x, x)
;; fast program: 1 + (((1 + (2 * (2 + x))) * ((2 + x) * x)) div (1 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (* (+ 2 y) y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (div (* (+ 1 (* 2 (+ 2 x))) (* (+ 2 x) x)) (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)