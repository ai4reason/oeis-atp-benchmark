;; sequence(s): A11869
;; terms: 0 0 0 0 0 1 1 2 3 4 5 6 8 9 11 13 15 17 19 21
;; small program: ((x * x) - x) div loop(x * x, 2, 2)
;; fast program: ((x * x) - x) div (2 * (2 * (2 + 2)))
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
(assert (forall ((x Int)) (= (small x) (div (- (* x x) x) v0))))
(assert (forall ((x Int)) (= (fast x) (div (- (* x x) x) (* 2 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
