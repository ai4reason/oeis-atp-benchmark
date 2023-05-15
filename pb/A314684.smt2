;; sequence(s): A314684
;; terms: 1 5 9 13 17 22 26 31 35 39 43 48 53 57 61 65 70 74 79 83
;; small program: (((loop(((((((2 + (x + x)) div (1 + (2 + 2))) * 2) + x) - x) div (1 + 2)) + y, x, 0) + 1) + x) + x) + x
;; fast program: (((((((((1 + ((x div (1 + (2 + (2 * (2 + 2))))) + x)) div (if x <= 0 then 1 else 2)) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (- (+ (* (div (+ 2 (+ x x)) (+ 1 (+ 2 2))) 2) x) x) (+ 1 2)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (v0 x) 1) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (* (+ (div (+ 1 (+ (div x (+ 1 (+ 2 (* 2 (+ 2 2))))) x)) (ite (<= x 0) 1 2)) x) 2) 1) x) (+ 1 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
