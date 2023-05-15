;; sequence(s): A314239
;; terms: 1 5 11 17 23 28 34 39 45 51 57 62 67 73 79 85 90 96 101 107
;; small program: (((((((((loop((y - (x div (1 + (2 + 2)))) div 2, x, 1) + x) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) + x
;; fast program: (((((((((((1 + (2 + 2)) * (1 + x)) div (1 + (2 + (2 * (2 + 2))))) * 2) + 1) + x) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (- y (div x (+ 1 (+ 2 2)))) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (+ (+ (* (+ (+ (+ (v0 x) x) x) x) 2) 1) x) (+ 1 2)) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ (+ (* (div (* (+ 1 (+ 2 2)) (+ 1 x)) (+ 1 (+ 2 (* 2 (+ 2 2))))) 2) 1) x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
