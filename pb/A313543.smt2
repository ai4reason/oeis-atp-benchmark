;; sequence(s): A313543
;; terms: 1 5 10 14 19 23 29 33 38 42 47 52 57 62 66 71 75 81 85 90
;; small program: ((((((((((((loop((((((x mod (1 + (2 + 2))) + x) div 2) mod 2) + x) + 1, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) + x) div (1 + 2)) + x
;; fast program: ((((((((((((((((1 + (2 * (2 - x))) div (1 + (2 + (2 * (2 + 2))))) + x) + x) * 2) + (if x <= 0 then 1 else x)) + x) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (div (+ (mod x (+ 1 (+ 2 2))) x) 2) 2) x) 1))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (+ (* (+ (div (+ (+ (* (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) 2) 1) x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (* (+ (div (+ (+ (* (+ (+ (* (+ (+ (div (+ 1 (* 2 (- 2 x))) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) x) 2) (ite (<= x 0) 1 x)) x) 2) 1) x) (+ 1 2)) x) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
