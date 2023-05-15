;; sequence(s): A316224
;; terms: 0 15 90 273 612 1155 1950 3045 4488 6327 8610 11385 14700 18603 23142 28365 34320 41055 48618 57057
;; small program: (1 + 2) * loop((y * y) + x, x + x, 0)
;; fast program: (1 + (x + x)) * ((2 * (2 * (x * x))) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 2) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ x x)) (+ (* 2 (* 2 (* x x))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)