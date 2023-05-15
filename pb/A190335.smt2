;; sequence(s): A190335
;; terms: 1 3 6 7 9 12 13 15 18 20 21 24 26 27 30 32 35 36 38 41
;; small program: ((((loop(((((y * y) div 2) + y) div (x * x)) + x, x, 1) + x) * (1 + 2)) - 1) - x) div 2
;; fast program: (((((((((2 * (2 + (x + x))) div (1 + (2 * (2 * (2 * (2 + 2)))))) + 2) + x) + x) div (1 + 2)) * (1 + 2)) div 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ (div (* y y) 2) y) (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (- (- (* (+ (v0 x) x) (+ 1 2)) 1) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* (div (+ (+ (+ (div (* 2 (+ 2 (+ x x))) (+ 1 (* 2 (* 2 (* 2 (+ 2 2)))))) 2) x) x) (+ 1 2)) (+ 1 2)) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
