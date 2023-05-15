;; sequence(s): A272125
;; terms: 0 1 24 171 704 2125 5256 11319 22016 39609 67000 107811 166464 248261 359464 507375 700416 948209 1261656 1653019
;; small program: (loop((2 * ((y * y) - y)) + x, x, x) * x) * x
;; fast program: ((((2 * ((x * x) * x)) + x) div (1 + 2)) * x) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (- (* y y) y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (* (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (* (div (+ (* 2 (* (* x x) x)) x) (+ 1 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
