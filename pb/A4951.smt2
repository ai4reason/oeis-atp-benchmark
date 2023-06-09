;; sequence(s): A4951-A4971
;; terms: 0 2207 4414 6621 8828 11035 13242 15449 17656 19863 22070 24277 26484 28691 30898 33105 35312 37519 39726 41933
;; small program: loop((x * x) - 2, 1 + 2, 1 + 2) * x
;; fast program: (loop((x - 2) * x, 2, 2 * (2 + 2)) * x) - x
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
(assert (forall ((x Int)) (= (f0 x) (- (* x x) 2))))
(assert (= g0 (+ 1 2)))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* v0 x))))
(assert (forall ((x Int)) (= (f1 x) (* (- x 2) x))))
(assert (= g1 2))
(assert (= h1 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (- (* v1 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
