;; sequence(s): A195167
;; terms: 0 3 5 7 9 11 14 16 18 20 22 25 27 29 31 33 36 38 40 42
;; small program: (((loop((y * y) div (x - y), x, 0) mod (2 + x)) div 2) + x) + x
;; fast program: ((((2 * (x + x)) div (1 + (2 * (2 + (2 * (2 + 2)))))) + (if x <= 0 then 0 else 1)) + x) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (div (mod (v0 x) (+ 2 x)) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (* 2 (+ x x)) (+ 1 (* 2 (+ 2 (* 2 (+ 2 2)))))) (ite (<= x 0) 0 1)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
