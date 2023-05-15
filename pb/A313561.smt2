;; sequence(s): A313561
;; terms: 1 5 10 14 19 24 28 33 38 43 48 52 57 62 66 71 76 81 86 90
;; small program: (((loop((((x div 2) div (1 + 2)) + y) - (x div 2), x, 1) + x) + x) + x) + x
;; fast program: (((((2 * ((1 + (x div (2 * (2 + 2)))) + x)) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (+ (div (div x 2) (+ 1 2)) y) (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (v0 x) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (* 2 (+ (+ 1 (div x (* 2 (+ 2 2)))) x)) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
