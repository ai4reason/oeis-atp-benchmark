;; sequence(s): A121377
;; terms: 48 49 50 51 52 53 54 55 56 57
;; small program: loop((x + y) * x, 2, 2) + x
;; fast program: (2 * (2 * (2 * (2 + (2 + 2))))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ x y) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (* 2 (+ 2 (+ 2 2))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
