;; sequence(s): A186274
;; terms: 2 5 9 12 15 19 22 26 29 33 36 40 43 46 50 53 57 60 64 67
;; small program: (loop((((y * y) div ((1 + 2) + (x + x))) + y) + y, x + x, 0) - x) + 2
;; fast program: (((((((((((((((x div 2) - (x div (2 * (2 + 2)))) + x) + x) div (2 + 2)) + 1) + x) div 2) + x) div 2) + x) + x) div 2) + x) + x) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (* y y) (+ (+ 1 2) (+ x x))) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (v0 x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (div (+ (div (+ (+ (div (+ (+ (- (div x 2) (div x (* 2 (+ 2 2)))) x) x) (+ 2 2)) 1) x) 2) x) 2) x) x) 2) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
