;; sequence(s): A72633
;; terms: 1 2 4 5 7 8 10 11 13 14 15 17 18 20 21 23 24 26 27 28
;; small program: (((1 + (((loop(x div (2 + y), 2, x) - x) div (2 * (2 + 2))) + x)) div 2) + 1) + x
;; fast program: (((1 + ((((x div (2 * (2 + (2 + 2)))) - x) div (2 * (2 + 2))) + x)) div 2) + 1) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ 1 (+ (div (- (v0 x) x) (* 2 (+ 2 2))) x)) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ 1 (+ (div (- (div x (* 2 (+ 2 (+ 2 2)))) x) (* 2 (+ 2 2))) x)) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
