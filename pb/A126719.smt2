;; sequence(s): A126719
;; terms: 23 31 37 41 43 43 41 37 31 23 13 1 ~13 ~29 ~47 ~67 ~89 ~113 ~139 ~167
;; small program: 1 + ((2 + x) * (loop(1 + (x + x), 2, 2) - x))
;; fast program: 1 + ((1 + (2 + ((2 * (2 + 2)) - x))) * (2 + x))
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
(assert (forall ((x Int)) (= (small x) (+ 1 (* (+ 2 x) (- v0 x))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (+ 1 (+ 2 (- (* 2 (+ 2 2)) x))) (+ 2 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
