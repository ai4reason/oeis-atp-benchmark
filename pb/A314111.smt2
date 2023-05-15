;; sequence(s): A314111
;; terms: 1 5 11 16 21 26 31 36 41 47 52 57 63 68 73 78 83 88 93 99
;; small program: ((((loop((((((1 + x) div (1 + 2)) * (x div 2)) mod 2) + 1) + x, x - 1, 2) - 1) + x) + x) + x) + x
;; fast program: (((((((((((2 * (2 + x)) + x) div (2 + (2 * (2 + 2)))) + x) * 2) + 1) + x) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (* (div (+ 1 x) (+ 1 2)) (div x 2)) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (- (v0 x) 1) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (+ (* (+ (div (+ (* 2 (+ 2 x)) x) (+ 2 (* 2 (+ 2 2)))) x) 2) 1) x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
