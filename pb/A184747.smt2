;; sequence(s): A184747
;; terms: 2 5 8 11 15 18 21 24 28 31 34 37 40 44 47 50 53 57 60 63
;; small program: (loop(((y * y) div (2 + x)) + y, 2 + (2 * (x + x)), 0) + 1) div 2
;; fast program: (2 + (((((x + x) - (x div (1 + (2 * (2 + 2))))) div (2 * (2 + 2))) + x) + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (* 2 (+ x x))))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (+ (v0 x) 1) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 2 (+ (+ (div (- (+ x x) (div x (+ 1 (* 2 (+ 2 2))))) (* 2 (+ 2 2))) x) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
