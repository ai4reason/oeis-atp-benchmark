;; sequence(s): A303302
;; terms: 0 34 136 306 544 850 1224 1666 2176 2754 3400 4114 4896 5746 6664 7650 8704 9826 11016 12274
;; small program: 2 * ((1 + loop(x * x, 2, 2)) * (x * x))
;; fast program: 2 * ((1 + (2 * (2 * (2 + 2)))) * (x * x))
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
(assert (forall ((x Int)) (= (small x) (* 2 (* (+ 1 v0) (* x x))))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* (+ 1 (* 2 (* 2 (+ 2 2)))) (* x x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
