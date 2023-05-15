;; sequence(s): A195028
;; terms: 0 27 82 165 276 415 582 777 1000 1251 1530 1837 2172 2535 2926 3345 3792 4267 4770 5301
;; small program: ((1 + x) * ((loop(x * x, 2, 2) - 2) * x)) - x
;; fast program: (2 * (((2 * ((1 + 2) * (1 + x))) + x) * x)) + x
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
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 x) (* (- v0 2) x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* (+ (* 2 (* (+ 1 2) (+ 1 x))) x) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
