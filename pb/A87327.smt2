;; sequence(s): A87327
;; terms: 1 2 6 8 13 18 25 32 41 50 61 72 85 98 113 128 145 162 181 200
;; small program: (((loop((1 div x) + y, x, 2) * x) div 2) + 1) + x
;; fast program: ((((1 + (if (x - 2) <= 0 then x else 1)) + x) * x) div 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div 1 x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (* (v0 x) x) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* (+ (+ 1 (ite (<= (- x 2) 0) x 1)) x) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
