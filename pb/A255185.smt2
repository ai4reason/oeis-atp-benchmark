;; sequence(s): A255185
;; terms: 0 1 26 75 148 245 366 511 680 873 1090 1331 1596 1885 2198 2535 2896 3281 3690 4123
;; small program: ((x - 1) * loop((2 + y) * x, 2, x)) + x
;; fast program: (2 * (2 * ((1 + 2) * ((x * x) - x)))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (- x 1) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (* (+ 1 2) (- (* x x) x)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
