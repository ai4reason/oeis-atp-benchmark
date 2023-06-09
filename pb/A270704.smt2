;; sequence(s): A270704
;; terms: 0 14 76 186 344 550 804 1106 1456 1854 2300 2794 3336 3926 4564 5250 5984 6766 7596 8474
;; small program: 2 * (loop(((2 + y) * x) - 1, 2, x) * x)
;; fast program: 2 * ((2 * ((1 + 2) * ((2 * (x * x)) - x))) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* (+ 2 y) x) 1))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* 2 (* (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (* 2 (+ (* 2 (* (+ 1 2) (- (* 2 (* x x)) x))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
