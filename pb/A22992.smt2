;; sequence(s): A22992
;; terms: 36 35 34 33 32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17
;; small program: 0 - loop(x - y, 2 * (2 + 2), x)
;; fast program: loop(x * x, 1, 2 + (2 + 2)) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (= g0 (* 2 (+ 2 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- 0 (v0 x)))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (= h1 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (- v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
