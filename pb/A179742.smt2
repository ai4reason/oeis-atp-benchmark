;; sequence(s): A179742
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; small program: if ((2 + x) mod loop((2 + y) * x, 2, 2)) <= 0 then (1 + 2) else 1
;; fast program: if ((2 + x) mod (2 * (2 * (2 + (2 + 2))))) <= 0 then (1 + 2) else 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (ite (<= (mod (+ 2 x) v0) 0) (+ 1 2) 1))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (+ 2 x) (* 2 (* 2 (+ 2 (+ 2 2))))) 0) (+ 1 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
