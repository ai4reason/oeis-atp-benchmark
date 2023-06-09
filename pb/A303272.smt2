;; sequence(s): A303272
;; terms: 0 1852 3704 5556 7408 9260 11112 12964 14816 16668 18520 20372 22224 24076 25928 27780 29632 31484 33336 35188
;; small program: loop((2 * (x * y)) + y, 2 + 2, 2 + 2) * x
;; fast program: ((2 + loop((x + y) * x, 2, 2 + (2 + 2))) + 2) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (* x y)) y))))
(assert (= g0 (+ 2 2)))
(assert (= h0 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* (+ x y) x))))
(assert (= g1 2))
(assert (= h1 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (* (+ (+ 2 v1) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
