;; sequence(s): A184922
;; terms: 2 5 9 12 16 19 22 26 29 33 36 39 43 46 50 53 57 60 63 67
;; small program: (loop((((y - 2) * y) div (x + y)) + y, 2 + x, 0) + x) + x
;; fast program: (((((2 + (((x div (2 + (2 * (2 + (2 + 2))))) + x) + x)) div (1 + (2 + 2))) + 2) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* (- y 2) y) (+ x y)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ 2 (+ (+ (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) x) x)) (+ 1 (+ 2 2))) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
