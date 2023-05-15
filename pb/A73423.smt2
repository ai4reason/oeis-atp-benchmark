;; sequence(s): A73423
;; terms: 2 1 0 1 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0
;; small program: (if loop(x - (if (y - x) <= 0 then y else 0), x, x) <= 0 then 1 else 0) * loop(1, x, 2)
;; fast program: ((if loop(x - (if (y - x) <= 0 then y else 0), x - (x div 2), x) <= 0 then 1 else 0) + 1) - (if x <= 0 then 0 else 1)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x (ite (<= (- y x) 0) y 0)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (= f1 1))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (small x) (* (ite (<= (v0 x) 0) 1 0) (v1 x)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (- x (ite (<= (- y x) 0) y 0)))))
(assert (forall ((x Int)) (= (g2 x) (- x (div x 2)))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (+ (ite (<= (v2 x) 0) 1 0) 1) (ite (<= x 0) 0 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
