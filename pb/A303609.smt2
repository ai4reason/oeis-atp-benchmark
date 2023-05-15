;; sequence(s): A303609
;; terms: 0 20 70 162 308 520 810 1190 1672 2268 2990 3850 4860 6032 7378 8910 10640 12580 14742 17138
;; small program: (loop(x + y, 2 * (2 + x), 0) * x) - x
;; fast program: (((2 * ((2 + x) * (2 + x))) + x) * x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ 2 x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (* 2 (* (+ 2 x) (+ 2 x))) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
