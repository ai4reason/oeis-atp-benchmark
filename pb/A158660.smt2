;; sequence(s): A158660
;; terms: 1 57 225 505 897 1401 2017 2745 3585 4537 5601 6777 8065 9465 10977 12601 14337 16185 18145 20217
;; small program: 1 + ((loop((1 + x) * (2 + x), 2, 1) * x) * x)
;; fast program: 1 + ((loop((x * x) - x, 1, 2 * (2 + 2)) * x) * x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (+ 1 x) (+ 2 x)))))
(assert (= g0 2))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ 1 (* (* v0 x) x)))))
(assert (forall ((x Int)) (= (f1 x) (- (* x x) x))))
(assert (= g1 1))
(assert (= h1 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (* v1 x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
