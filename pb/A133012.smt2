;; sequence(s): A133012
;; terms: 2 4 8 10 12 14 16 18 20 22 24 26 30 32 34 36 38 40 42 44
;; small program: ((((((x div 2) + x) + x) div (1 + (2 + x))) + x) * 2) + 2
;; fast program: (((if ((2 * (2 + (2 + 2))) - x) <= 0 then 2 else 1) + loop(0, 2 - x, 1)) + x) * 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ (div (+ (+ (div x 2) x) x) (+ 1 (+ 2 x))) x) 2) 2))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (* (+ (+ (ite (<= (- (* 2 (+ 2 (+ 2 2))) x) 0) 2 1) (v0 x)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
