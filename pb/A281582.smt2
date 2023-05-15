;; sequence(s): A281582
;; terms: 1 5 9 13 16 20 24 28 33 37 41 46 50 55 60 64 69 74 79 84
;; small program: ((((((((((loop(y - (x div 2), x * x, 0) + x) - 1) div 2) div 2) div 2) + x) div 2) + x) + x) + 2) + x
;; fast program: (((((((((((((1 + (2 * (2 + x))) * (2 + x)) div (2 + (2 + 2))) + x) div 2) - 1) + x) div 2) + x) + x) div 2) + x) + x) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (div (+ (div (div (div (- (+ (v0 x) x) 1) 2) 2) 2) x) 2) x) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (div (+ (- (div (+ (div (* (+ 1 (* 2 (+ 2 x))) (+ 2 x)) (+ 2 (+ 2 2))) x) 2) 1) x) 2) x) x) 2) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
