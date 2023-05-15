;; sequence(s): A188319
;; terms: 4 7 14 21 24 31 38 41 48 55 62 65 72 79 82 89 96 103 106 113
;; small program: (((loop(((y div 2) div (x * x)) + x, x * x, 1) + x) * 2) * 2) - x
;; fast program: (((((((((2 * (x + x)) div (1 + (2 * (2 * (2 * (2 + 2)))))) - x) div (1 + 2)) + x) * 2) + 2) + x) * 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (div y 2) (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (* (+ (v0 x) x) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (+ (* (+ (div (- (div (* 2 (+ x x)) (+ 1 (* 2 (* 2 (* 2 (+ 2 2)))))) x) (+ 1 2)) x) 2) 2) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
