;; sequence(s): A70620
;; terms: 0 1 32 21 25 17 6 9 23 34 26 27 7 35 29 24 33 19 15 22
;; small program: (loop(x * x, 2, x) * x) mod (loop(2 + (x * x), 2, 2) - 1)
;; fast program: ((((x * x) * x) * x) * x) mod (1 + loop(x * x, 1, 2 + (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (f1 x) (+ 2 (* x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (mod (* (v0 x) x) (- v1 1)))))
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 1))
(assert (= h2 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (fast x) (mod (* (* (* (* x x) x) x) x) (+ 1 v2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
