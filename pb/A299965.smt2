;; sequence(s): A299965
;; terms: 0 20 118 348 764 1420 2370 3668 5368 7524 10190 13420 17268 21788 27034 33060 39920 47668 56358 66044
;; small program: ((loop((1 + 2) * (1 + x), 2, x) * x) * x) - x
;; fast program: ((1 + 2) * (((2 * (2 + x)) + x) * (x * x))) - x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (+ 1 2) (+ 1 x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (* (v0 x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 2) (* (+ (* 2 (+ 2 x)) x) (* x x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
