;; sequence(s): A186275
;; terms: 2 3 4 6 7 9 10 11 13 14 16 17 18 20 21 23 24 25 27 28
;; small program: (((((((loop((x div (2 + 2)) + x, 2, x) div (2 + (2 + 2))) + x) div 2) + x) div 2) div 2) + x) + 2
;; fast program: (((((((x div (2 + (2 * (2 + 2)))) + (x div (2 * (2 + 2)))) div (2 + (2 + 2))) + x) + x) div (1 + (2 + 2))) + x) + 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (div x (+ 2 2)) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (div (+ (div (+ (div (v0 x) (+ 2 (+ 2 2))) x) 2) x) 2) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (div (+ (div x (+ 2 (* 2 (+ 2 2)))) (div x (* 2 (+ 2 2)))) (+ 2 (+ 2 2))) x) x) (+ 1 (+ 2 2))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
