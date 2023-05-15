;; sequence(s): A314039
;; terms: 1 5 11 15 21 25 31 35 41 46 51 57 61 67 71 77 81 87 92 97
;; small program: (((((((loop((if (((2 * ((x div 2) div (2 + (2 + 2)))) + x) mod (2 + 2)) <= 0 then 2 else 1) + x, x + x, 1) + x) + x) + x) * 2) + 1) + x) div (1 + 2)) + x
;; fast program: ((((((((((((((2 * ((x + x) + x)) - ((x div (1 + 2)) mod (1 + 2))) + 1) - (if x <= 0 then 1 else 2)) - x) div (1 + 2)) + 1) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod (+ (* 2 (div (div x 2) (+ 2 (+ 2 2)))) x) (+ 2 2)) 0) 2 1) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (+ (* (+ (+ (+ (v0 x) x) x) x) 2) 1) x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (* (+ (+ (div (- (- (+ (- (* 2 (+ (+ x x) x)) (mod (div x (+ 1 2)) (+ 1 2))) 1) (ite (<= x 0) 1 2)) x) (+ 1 2)) 1) x) 2) 1) x) (+ 1 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
