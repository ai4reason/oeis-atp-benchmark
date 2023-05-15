;; sequence(s): A184619
;; terms: 2 6 9 12 16 19 23 26 29 33 36 40 43 46 50 53 57 60 64 67
;; small program: ((loop((((((2 + y) * y) + y) div (2 + x)) + y) + y, x + x, 1) div 2) + 2) + x
;; fast program: (((((((((x div (2 + (2 * (2 + (2 + 2))))) - 2) + x) + x) div ((2 + 1) + 2)) + 1) + x) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (+ (* (+ 2 y) y) y) (+ 2 x)) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (v0 x) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ (+ (- (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) 2) x) x) (+ (+ 2 1) 2)) 1) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
