;; sequence(s): A314251
;; terms: 1 5 11 17 23 29 35 41 47 52 57 63 69 75 81 87 93 99 104 109
;; small program: ((((loop((if ((x div 2) mod (2 * (2 + 2))) <= 0 then 1 else 2) + x, x, 1) - 1) + x) + (if x <= 0 then 1 else x)) + x) + x
;; fast program: ((((((((((((((((((((((((((1 + (x + x)) div (1 + 2)) * (2 + 2)) + 1) + x) mod (2 + 1)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) + x) + x) + x) + x) + x) div (if x <= 0 then 1 else 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod (div x 2) (* 2 (+ 2 2))) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (- (v0 x) 1) x) (ite (<= x 0) 1 x)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (* (+ (+ (div (+ (+ (+ (+ (+ (+ (+ (+ (+ (div (+ (+ (* (mod (+ (+ (* (div (+ 1 (+ x x)) (+ 1 2)) (+ 2 2)) 1) x) (+ 2 1)) 2) 1) x) (+ 1 2)) x) x) x) x) x) x) x) x) x) (ite (<= x 0) 1 2)) x) x) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
