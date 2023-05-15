;; sequence(s): A47315
;; terms: 2 4 5 6 9 11 12 13 16 18 19 20 23 25 26 27 30 32 33 34
;; small program: loop((2 div (1 + (y mod (2 + 2)))) + x, x, 2) + x
;; fast program: (2 + ((2 * (x div (2 + 2))) - ((0 - x) div (2 + 2)))) + x
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
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 2 (- (* 2 (div x (+ 2 2))) (div (- 0 x) (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
