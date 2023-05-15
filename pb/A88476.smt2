;; sequence(s): A88476
;; terms: 10 11 12 13 14 15 16 17 18 20 21 22 23 24 25 26 27 28 30 31
;; small program: loop((2 * (2 + y)) + (x div (1 + 2)), 2, x) + x
;; fast program: 2 + (((2 * (2 + 2)) + (x div (1 + (2 * (2 + 2))))) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (+ 2 y)) (div x (+ 1 2))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (* 2 (+ 2 2)) (div x (+ 1 (* 2 (+ 2 2))))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
