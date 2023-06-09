;; sequence(s): A8531
;; terms: 1 10 50 150 340 650 1110 1750 2600 3690 5050 6710 8700 11050 13790 16950 20560 24650 29250 34390
;; small program: if x <= 0 then 1 else loop2(((y * y) * x) + x, x, 2, x, 2)
;; fast program: (1 + (x * x)) * ((2 * (x + x)) + (if x <= 0 then 1 else x))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (* y y) x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (ite (<= x 0) 1 (w0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* x x)) (+ (* 2 (+ x x)) (ite (<= x 0) 1 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
