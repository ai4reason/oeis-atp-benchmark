;; sequence(s): A194146
;; terms: 3 6 9 12 16 19 22 25 29 32 35 38 41 45 48 51 54 58 61 64
;; small program: (loop(2 + (((y * y) div ((x + y) * 2)) + y), 1 + x, 1) + x) + x
;; fast program: ((1 + 2) * (1 + x)) + ((1 + ((x div (2 * (2 + 2))) + x)) div ((2 + 2) + 1))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (* y y) (* (+ x y) 2)) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (+ 1 x)) (div (+ 1 (+ (div x (* 2 (+ 2 2))) x)) (+ (+ 2 2) 1))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
