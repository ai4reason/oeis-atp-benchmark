;; sequence(s): A184119
;; terms: 2 6 9 12 16 19 23 26 30 33 36 40 43 47 50 53 57 60 64 67
;; small program: (loop(2 + ((((2 + y) * y) div (x + y)) + y), x, 2) + x) + x
;; fast program: (((((((2 * (2 + x)) - (x div (2 + (2 * (2 + 2))))) + x) div (1 + (2 + (2 + 2)))) + 2) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (* (+ 2 y) y) (+ x y)) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (- (* 2 (+ 2 x)) (div x (+ 2 (* 2 (+ 2 2))))) x) (+ 1 (+ 2 (+ 2 2)))) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
