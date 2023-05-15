;; sequence(s): A335979
;; terms: 0 0 1 1 2 2 3 3 4 4 0 1 2 3 4 5 6 7 8 9
;; small program: (((2 * loop((y div (2 + (2 * (2 + 2)))) + x, x, 0)) + x) mod (1 + x)) div 2
;; fast program: (((1 + (x div (2 + (2 * (2 + 2))))) * (1 + (x mod (2 + (2 * (2 + 2)))))) - 1) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y (+ 2 (* 2 (+ 2 2)))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (mod (+ (* 2 (v0 x)) x) (+ 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (- (* (+ 1 (div x (+ 2 (* 2 (+ 2 2))))) (+ 1 (mod x (+ 2 (* 2 (+ 2 2)))))) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
