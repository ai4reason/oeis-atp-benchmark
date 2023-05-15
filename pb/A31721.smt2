;; sequence(s): A31721
;; terms: 1851 7400 16647 29592 46235 66576 90615 118352 149787 184920 223751 266280 312507 362432 416055 473376 534395 599112 667527 739640
;; small program: (1 + x) * (2 + loop((loop((x * x) + x, 2, 2) * x) + x, 2, 1 + x))
;; fast program: (((1 + loop((x + y) * x, 2, 2 + (2 + 2))) * (1 + x)) + 2) * (1 + x)
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ (* x x) x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (* v1 x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (+ 2 (v0 x))))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* (+ x y) x))))
(assert (= g2 2))
(assert (= h2 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (fast x) (* (+ (* (+ 1 v2) (+ 1 x)) 2) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)