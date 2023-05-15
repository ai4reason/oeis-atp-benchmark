;; sequence(s): A314068
;; terms: 1 5 11 15 22 27 31 37 42 49 53 57 64 69 75 79 84 91 95 101
;; small program: (((((((loop((y - (x div 2)) div 2, x, 1) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) - ((x div 2) mod 2)) + x) div 2
;; fast program: ((((((((((2 + (x + x)) div (1 + (2 + 2))) + x) * 2) + (if x <= 0 then 1 else x)) + x) * 2) + 1) + x) - ((x div 2) mod 2)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (- y (div x 2)) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (+ (- (+ (* (* (+ (+ (v0 x) x) x) (ite (<= x 0) 1 2)) 2) 1) (mod (div x 2) 2)) x) 2))))
(assert (forall ((x Int)) (= (fast x) (div (- (+ (+ (* (+ (+ (* (+ (div (+ 2 (+ x x)) (+ 1 (+ 2 2))) x) 2) (ite (<= x 0) 1 x)) x) 2) 1) x) (mod (div x 2) 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
