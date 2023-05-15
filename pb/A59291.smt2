;; sequence(s): A59291
;; terms: 0 0 0 0 1 1 2 3 4 6 8 11 14 18 22 27 33 39 46 54
;; small program: (loop((((1 + y) * y) div ((2 + (2 + 2)) * 2)) + x, x, 2) div 2) div 2
;; fast program: ((((((((((((((((((1 + ((x * x) + x)) * (2 + x)) div (1 + 2)) + x) + x) div 2) + 1) + x) div 2) div 2) + 1) + x) div 2) + 1) - (x mod 2)) + x) + x) div (2 + 1)) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* (+ 1 y) y) (* (+ 2 (+ 2 2)) 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (div (v0 x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (- (div (+ (+ (- (+ (div (+ (+ (div (div (+ (+ (div (+ (+ (div (* (+ 1 (+ (* x x) x)) (+ 2 x)) (+ 1 2)) x) x) 2) 1) x) 2) 2) 1) x) 2) 1) (mod x 2)) x) x) (+ 2 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
