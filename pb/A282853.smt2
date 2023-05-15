;; sequence(s): A282853
;; terms: 0 1 36 105 208 345 516 721 960 1233 1540 1881 2256 2665 3108 3585 4096 4641 5220 5833
;; small program: (((x - 1) * loop(x * x, 2, 2)) + x) * x
;; fast program: ((2 * (2 * (2 * ((x - 2) + x)))) + x) * x
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
(assert (forall ((x Int)) (= (small x) (* (+ (* (- x 1) v0) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* 2 (* 2 (* 2 (+ (- x 2) x)))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
