;; sequence(s): A321180
;; terms: ~1 16 67 152 271 424 611 832 1087 1376 1699 2056 2447 2872 3331 3824 4351 4912 5507 6136
;; small program: ((1 + loop(x * x, 2, 2)) * (x * x)) - 1
;; fast program: ((1 + (2 * (2 * (2 + 2)))) * (x * x)) - 1
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
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 v0) (* x x)) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (* 2 (* 2 (+ 2 2)))) (* x x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
