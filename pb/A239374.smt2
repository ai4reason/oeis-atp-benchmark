;; sequence(s): A239374
;; terms: 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
;; small program: ((x div loop((2 * (x * x)) - 1, 2, 2)) * (2 + 2)) + 2
;; fast program: loop(2 + (2 + 2), x - ((((((1 + 2) * 2) * 2) * 2) * 2) * 2), 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- (* 2 (* x x)) 1))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (div x v0) (+ 2 2)) 2))))
(assert (= f1 (+ 2 (+ 2 2))))
(assert (forall ((x Int)) (= (g1 x) (- x (* (* (* (* (* (+ 1 2) 2) 2) 2) 2) 2)))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
