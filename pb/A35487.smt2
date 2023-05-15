;; sequence(s): A35487
;; terms: 2 6 11 15 19 23 28 32 36 40 44 49 53 57 61 66 70 74 78 83
;; small program: (loop(((y * y) div (2 + x)) + y, 1 + (x + x), 0) + 1) + x
;; fast program: ((((((1 + (((2 - (x div (1 + (2 * (2 + 2))))) div 2) + x)) div (2 + 2)) + 2) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ 1 (+ (div (- 2 (div x (+ 1 (* 2 (+ 2 2))))) 2) x)) (+ 2 2)) 2) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
