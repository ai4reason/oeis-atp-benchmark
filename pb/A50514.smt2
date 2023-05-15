;; sequence(s): A50514
;; terms: 0 0 1 0 2 4 3 4 7 2 8 4 0 10 7 4 1 16 14 12
;; small program: (2 * loop(1 + (x * x), 2, 2)) mod (1 + x)
;; fast program: (2 * (2 + (2 * (2 * (2 + (2 + 2)))))) mod (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (mod (* 2 v0) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (* 2 (+ 2 (* 2 (* 2 (+ 2 (+ 2 2)))))) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)