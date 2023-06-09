;; sequence(s): A47366
;; terms: 1 3 4 5 8 10 11 12 15 17 18 19 22 24 25 26 29 31 32 33
;; small program: loop((2 div (1 + (y mod (2 + 2)))) + x, x, 1) + x
;; fast program: 1 + (((2 * (x div (2 + 2))) - ((0 - x) div (2 + 2))) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div 2 (+ 1 (mod y (+ 2 2)))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (- (* 2 (div x (+ 2 2))) (div (- 0 x) (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
