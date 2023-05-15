;; sequence(s): A186225
;; terms: 2 3 5 6 8 9 11 13 14 16 17 19 20 22 24 25 27 28 30 32
;; small program: (((((loop((y * y) div (x + y), x, 0) div 2) div 2) + x) div 2) + 2) + x
;; fast program: 2 + (((((1 + (x + x)) div (1 + (2 * (2 + (2 + 2))))) + x) div 2) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* y y) (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (div (div (v0 x) 2) 2) x) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (div (+ (div (+ 1 (+ x x)) (+ 1 (* 2 (+ 2 (+ 2 2))))) x) 2) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)