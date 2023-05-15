;; sequence(s): A206805
;; terms: 1 3 4 6 8 9 11 13 14 16 17 19 21 22 24 26 27 29 30 32
;; small program: loop(1 + (y - ((((x div 2) div (1 + 2)) + x) div 2)), x, 1) + x
;; fast program: ((1 - (((1 + (2 + (2 + 2))) * (1 + x)) div (1 + (2 + (2 * (2 * (2 + 2))))))) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- y (div (+ (div (div x 2) (+ 1 2)) x) 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- 1 (div (* (+ 1 (+ 2 (+ 2 2))) (+ 1 x)) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2))))))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
