;; sequence(s): A227148
;; terms: 0 3 4 7 8 11 12 15 16 19 20 23 25 26 29 30 33 34 37 38
;; small program: (((loop(x div (2 + y), 2, x) + x) mod 2) + x) + x
;; fast program: ((((x div (2 * (2 + (2 + 2)))) + x) mod 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div x (+ 2 y)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (mod (+ (v0 x) x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (mod (+ (div x (* 2 (+ 2 (+ 2 2)))) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
