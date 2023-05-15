;; sequence(s): A276872
;; terms: 1 6 11 16 21 28 33 38 43 50 55 60 65 70 77 82 87 92 99 104
;; small program: (((loop((((y div 2) + y) div (x * x)) + x, x * x, 1) + x) * 2) - 1) + x
;; fast program: ((((((((if x <= 0 then 1 else x) - 1) - (x div (2 + (2 * (2 + 2))))) div (2 + 2)) + x) + x) * 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ (div y 2) y) (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (* (+ (v0 x) x) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (+ (div (- (- (ite (<= x 0) 1 x) 1) (div x (+ 2 (* 2 (+ 2 2))))) (+ 2 2)) x) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
