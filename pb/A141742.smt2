;; sequence(s): A141742
;; terms: 3 6 7 12 13 14 15 24 25 26 27 28 29 30
;; small program: 2 + (loop((x mod y) + y, 1 + x, 0) + x)
;; fast program: (((1 + loop((x mod y) + y, (1 + x) div (2 + 2), 0)) * ((if x <= 0 then 1 else 2) * 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod x y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (v0 x) x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (mod x y) y))))
(assert (forall ((x Int)) (= (g1 x) (div (+ 1 x) (+ 2 2)))))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ 1 (v1 x)) (* (ite (<= x 0) 1 2) 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
