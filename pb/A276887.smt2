;; sequence(s): A276887
;; terms: 1 2 3 6 7 8 11 12 15 16 17 20 21 22 25 26 29 30 31 34
;; small program: (((loop((y * y) div (x - y), x, 0) + x) * 2) + 1) + x
;; fast program: ((((((x + x) + (x div (2 + (2 * (2 * (2 + 2)))))) + x) div (2 * (2 + 2))) * 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* y y) (- x y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ (v0 x) x) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (div (+ (+ (+ x x) (div x (+ 2 (* 2 (* 2 (+ 2 2)))))) x) (* 2 (+ 2 2))) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
