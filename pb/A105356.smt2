;; sequence(s): A105356
;; terms: 1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39
;; small program: (loop(1 + ((x div 2) div 2), 1 + 2, x) + x) + x
;; fast program: ((if ((2 * (2 + (2 * (2 + (2 * (2 + 2)))))) - x) <= 0 then 2 else 1) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (div (div x 2) 2)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (ite (<= (- (* 2 (+ 2 (* 2 (+ 2 (* 2 (+ 2 2)))))) x) 0) 2 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
