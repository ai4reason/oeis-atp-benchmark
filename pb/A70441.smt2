;; sequence(s): A70441
;; terms: 0 1 4 9 16 6 17 11 7 5 5 7 11 17 6 16 9 4 1 0
;; small program: (x * x) mod (1 + (2 + loop(x * x, 2, 2)))
;; fast program: (x * x) mod (1 + (2 + (2 * (2 * (2 + 2)))))
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
(assert (forall ((x Int)) (= (small x) (mod (* x x) (+ 1 (+ 2 v0))))))
(assert (forall ((x Int)) (= (fast x) (mod (* x x) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
