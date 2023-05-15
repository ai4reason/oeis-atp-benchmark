;; sequence(s): A70479
;; terms: 0 1 8 10 13 6 12 3 2 15 14 5 11 4 7 9 16 0 1 8
;; small program: ((x * x) * x) mod (1 + loop(x * x, 2, 2))
;; fast program: ((x * x) * x) mod (1 + (2 * (2 * (2 + 2))))
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
(assert (forall ((x Int)) (= (small x) (mod (* (* x x) x) (+ 1 v0)))))
(assert (forall ((x Int)) (= (fast x) (mod (* (* x x) x) (+ 1 (* 2 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
