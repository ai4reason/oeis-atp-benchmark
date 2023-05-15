;; sequence(s): A312892
;; terms: 1 4 9 13 17 21 25 29 33 38 42 46 51 55 59 63 67 71 75 80
;; small program: (((loop((((((1 + x) div (1 + 2)) * (x div 2)) mod 2) + 1) + x, x - 1, 2) - 1) + x) + x) + x
;; fast program: ((((((((((2 * (2 + x)) + x) div (2 + (2 * (2 + 2)))) + x) * 2) + 1) + x) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (* (+ (div (+ (* 2 (+ 2 x)) x) (+ 2 (* 2 (+ 2 2)))) x) 2) 1) x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
