;; sequence(s): A313572
;; terms: 1 5 10 14 19 24 30 35 40 44 49 54 59 64 68 73 78 84 89 94
;; small program: ((((((((((((((((((loop((y - (x div (1 + (2 + 2)))) div 2, x, 1) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) div (1 + 2)) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) + x) div (1 + 2)) - x
;; fast program: (((((((((((((((((((((1 + (2 + 2)) * (1 + x)) div (1 + (2 + (2 * (2 + 2))))) + (if x <= 0 then 1 else x)) + x) * 2) * 2) + 1) div (1 + 2)) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) + x) div (1 + 2)) - x
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
(assert (forall ((x Int)) (= (small x) (- (div (+ (+ (* (+ (div (+ (+ (* (* (+ (+ (div (+ (* (* (+ (+ (v0 x) x) x) (ite (<= x 0) 1 2)) 2) 1) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) 2) 1) x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (- (div (+ (+ (* (+ (div (+ (+ (* (* (+ (+ (div (+ (* (* (+ (+ (div (* (+ 1 (+ 2 2)) (+ 1 x)) (+ 1 (+ 2 (* 2 (+ 2 2))))) (ite (<= x 0) 1 x)) x) 2) 2) 1) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
