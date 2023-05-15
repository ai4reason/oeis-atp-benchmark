;; sequence(s): A212976
;; terms: 0 6 12 36 60 114 168 264 360 510 660 876 1092 1386 1680 2064 2448 2934 3420 4020
;; small program: loop(loop(y - x, x * x, 1) * x, 1, 1 + x)
;; fast program: (1 + x) * (2 + ((2 * (((x * x) - 1) div (2 + 2))) + x))
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- y x))))
(assert (forall ((x Int)) (= (g1 x) (* x x))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (* (v1 x) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 x) (+ 2 (+ (* 2 (div (- (* x x) 1) (+ 2 2))) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
