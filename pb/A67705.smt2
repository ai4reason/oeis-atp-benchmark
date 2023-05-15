;; sequence(s): A67705
;; terms: 33 88 165 264 385 528 693 880 1089 1320 1573 1848 2145 2464 2805 3168 3553 3960 4389 4840
;; small program: (1 + (2 + x)) * ((1 + x) * loop(1 + (x + x), 2, 2))
;; fast program: (1 + (2 + (2 * (2 + 2)))) * (((2 + x) * (2 + x)) - 1)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (+ 2 x)) (* (+ 1 x) v0)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (- (* (+ 2 x) (+ 2 x)) 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)