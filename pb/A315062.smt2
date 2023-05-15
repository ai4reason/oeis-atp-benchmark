;; sequence(s): A315062
;; terms: 1 5 9 15 20 25 31 36 41 47 51 56 61 65 71 76 81 87 92 97
;; small program: ((((((((loop((((if (((x * x) mod (2 + (2 * (2 * (2 + 2))))) - 2) <= 0 then 2 else x) mod 2) + 1) + x, x, 1) - 1) + x) + (if x <= 0 then 1 else x)) + x) * 2) + 1) div (1 + 2)) + x) + x
;; fast program: ((((((((((((((((2 * (x + x)) + x) div (1 + (2 + (2 * (2 + 2))))) + 1) + x) div (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) * (2 * 2)) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (ite (<= (- (mod (* x x) (+ 2 (* 2 (* 2 (+ 2 2))))) 2) 0) 2 x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (* (+ (+ (+ (- (v0 x) 1) x) (ite (<= x 0) 1 x)) x) 2) 1) (+ 1 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (* (+ (+ (div (+ (+ (* (div (+ (+ (div (+ (* 2 (+ x x)) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) (* 2 2)) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
