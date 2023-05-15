;; sequence(s): A70494
;; terms: 0 1 8 27 0 29 24 23 0 25 8 19 0 21 24 15 0 17 8 11
;; small program: ((x * x) * x) mod (2 * loop(x * x, 2, 2))
;; fast program: ((x * x) * x) mod (2 * (2 * (2 * (2 + 2))))
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
(assert (forall ((x Int)) (= (small x) (mod (* (* x x) x) (* 2 v0)))))
(assert (forall ((x Int)) (= (fast x) (mod (* (* x x) x) (* 2 (* 2 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
