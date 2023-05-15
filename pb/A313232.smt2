;; sequence(s): A313232
;; terms: 1 4 9 15 20 24 28 33 39 44 48 52 57 63 68 72 76 81 87 92
;; small program: (((loop(((((((1 + x) div (1 + 2)) * x) * 2) mod (1 + 2)) + 1) + x, x, 1) - 1) + x) + (if x <= 0 then 1 else x)) + x
;; fast program: ((((((((((((x mod (1 + (2 + 2))) + x) + x) + x) div (1 + (2 + 2))) + x) * 2) + (if x <= 0 then 1 else x)) * 2) + 1) div (1 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (* (* (div (+ 1 x) (+ 1 2)) x) 2) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) (ite (<= x 0) 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* (+ (* (+ (div (+ (+ (+ (mod x (+ 1 (+ 2 2))) x) x) x) (+ 1 (+ 2 2))) x) 2) (ite (<= x 0) 1 x)) 2) 1) (+ 1 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
