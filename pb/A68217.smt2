;; sequence(s): A68217
;; terms: 2 4 2 8 10 4 14 16 6 20 22 8 26 28 10 32 34 12 38 40
;; small program: (2 * (x div (1 + (((2 + x) * x) mod (1 + 2))))) + 2
;; fast program: (2 * loop(x div (1 + 2), (x mod (1 + 2)) - 1, x)) + 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (div x (+ 1 (mod (* (+ 2 x) x) (+ 1 2))))) 2))))
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 2)))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (v0 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
