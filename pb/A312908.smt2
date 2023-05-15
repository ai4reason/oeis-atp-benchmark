;; sequence(s): A312908
;; terms: 1 4 9 13 17 23 27 31 36 40 44 49 53 57 63 67 71 76 80 84
;; small program: (((((((loop((y - x) div 2, x, 1) + x) + x) * 2) * 2) + 1) + x) div (1 + 2)) + x
;; fast program: ((((((((1 + (if x <= 0 then 2 else x)) div (1 + 2)) + x) + x) * (2 + 2)) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (- y x) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (+ (* (* (+ (+ (v0 x) x) x) 2) 2) 1) x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (* (+ (+ (div (+ 1 (ite (<= x 0) 2 x)) (+ 1 2)) x) x) (+ 2 2)) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
