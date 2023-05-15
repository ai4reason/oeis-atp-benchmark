;; sequence(s): A21433
;; terms: 0 0 2 3 3 1 0 0 2 3 3 1 0 0 2 3 3 1 0 0
;; small program: loop(2 + loop((y - 1) - x, x, 2), x, 1) div 2
;; fast program: ((1 + (x + x)) * ((x * x) - (x mod (1 + 2)))) mod (2 + 2)
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- (- y 1) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (+ 2 (v1 x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (* (+ 1 (+ x x)) (- (* x x) (mod x (+ 1 2)))) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
