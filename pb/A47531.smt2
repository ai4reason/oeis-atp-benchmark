;; sequence(s): A47531
;; terms: 2 3 7 10 11 15 18 19 23 26 27 31 34 35 39 42 43 47 50 51
;; small program: loop((((x + y) div ((y mod 2) + 2)) * y) + x, 2, x)
;; fast program: (1 + (2 * ((x div (1 + 2)) + x))) + ((1 - x) mod (1 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (div (+ x y) (+ (mod y 2) 2)) y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (* 2 (+ (div x (+ 1 2)) x))) (mod (- 1 x) (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
