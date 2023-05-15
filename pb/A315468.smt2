;; sequence(s): A315468
;; terms: 1 6 11 16 21 26 31 36 41 46 52 58 63 68 73 78 83 88 93 98
;; small program: ((((loop((if (((x div (1 + 2)) mod (2 + 2)) - 2) <= 0 then 1 else 2) + x, x, 0) + 1) + x) + x) + x) + x
;; fast program: (((((((((if x <= 0 then 1 else x) - 1) div (2 + (2 * (2 + 2)))) + 1) + x) + (x div (2 + (2 * (2 + 2))))) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (- (mod (div x (+ 1 2)) (+ 2 2)) 2) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (v0 x) 1) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 2 (* 2 (+ 2 2)))) 1) x) (div x (+ 2 (* 2 (+ 2 2))))) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
