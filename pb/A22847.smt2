;; sequence(s): A22847
;; terms: 0 2 3 5 7 9 10 12 14 16 17 19 21 23 24 26 28 29 31 33
;; small program: (loop(y - ((x * y) div ((x + y) + y)), x + x, 0) div 2) + x
;; fast program: (((1 - ((x div (2 + (2 * (2 + (2 + 2))))) + x)) div (2 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (* x y) (+ (+ x y) y))))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- 1 (+ (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) x)) (+ 2 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
