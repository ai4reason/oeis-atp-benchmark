;; sequence(s): A240933
;; terms: 0 0 512 39366 786432 7812500 50388480 242121642 939524096 3099363912 9000000000 23579476910 56757583872 127253992476 268593608192 538207031250 1030792151040 1897406023952 3372107936256 5808378560022
;; small program: (x - 1) * loop((x * x) * x, 2, x)
;; fast program: (x - 1) * loop((x * x) * x, 1, (x * x) * x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (* x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- x 1) (v0 x)))))
(assert (forall ((x Int)) (= (f1 x) (* (* x x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (- x 1) (v1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)