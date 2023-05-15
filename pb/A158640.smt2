;; sequence(s): A158640
;; terms: 51 207 467 831 1299 1871 2547 3327 4211 5199 6291 7487 8787 10191 11699 13311 15027 16847 18771 20799
;; small program: (2 * ((1 + x) * ((1 + x) * loop(1 + (x * x), 2, 2)))) - 1
;; fast program: ((1 + (2 * (2 + (2 + 2)))) * loop(x * x, 1, 2 + (x + x))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (- (* 2 (* (+ 1 x) (* (+ 1 x) v0))) 1))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (* 2 (+ 2 (+ 2 2)))) (v1 x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)