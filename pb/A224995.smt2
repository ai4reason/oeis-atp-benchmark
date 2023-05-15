;; sequence(s): A224995
;; terms: 2 4 6 9 11 14 16 19 21 24 26 29 31 34 36 38 41 43 46 48
;; small program: ((((loop(((x div 2) + y) div (1 + 2), x, 0) + x) div (1 + 2)) + 2) + x) + x
;; fast program: ((((((((if x <= 0 then 1 else x) - 1) div (1 + 2)) + x) + x) div (1 + (2 + 2))) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ (div x 2) y) (+ 1 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (+ (v0 x) x) (+ 1 2)) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 2)) x) x) (+ 1 (+ 2 2))) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
