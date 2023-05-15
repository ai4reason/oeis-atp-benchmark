;; sequence(s): A314955
;; terms: 1 5 9 14 20 25 29 34 40 45 49 54 59 63 68 74 79 83 88 94
;; small program: (((((((loop((if ((((x * x) mod (1 + (2 * (2 + (2 + 2))))) mod (2 + 2)) - 2) <= 0 then 1 else 2) + x, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)) * 2) + 1) div (1 + 2)) + x) + x
;; fast program: ((((((((((((((((((x + x) + x) div (1 + (2 + (2 * (2 + 2))))) * 2) + 1) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + x) * 2) + 2) + x) * 2) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (- (mod (mod (* x x) (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 2 2)) 2) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (* (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)) 2) 1) (+ 1 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (* (+ (+ (* (+ (div (+ (+ (- (+ (+ (* (div (+ (+ x x) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 2) 1) x) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) x) 2) 2) x) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
