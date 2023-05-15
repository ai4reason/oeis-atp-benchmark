;; sequence(s): A22988
;; terms: 32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13
;; small program: (2 * loop(x * x, 2, 2)) - x
;; fast program: (2 * (2 * (2 * (2 + 2)))) - x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (- (* 2 v0) x))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* 2 (* 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
