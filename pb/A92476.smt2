;; sequence(s): A92476
;; terms: 1 3 9 14 16 22 27 29 35 40 42 48 53 55 61 66 68 74 79 81
;; small program: loop(((x + x) mod (1 + (2 * (2 + (2 + 2))))) + x, x, 1)
;; fast program: ((2 * (x + x)) + ((x - 1) mod (1 + 2))) + ((x - 2) div (1 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (mod (+ x x) (+ 1 (* 2 (+ 2 (+ 2 2))))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* 2 (+ x x)) (mod (- x 1) (+ 1 2))) (div (- x 2) (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)