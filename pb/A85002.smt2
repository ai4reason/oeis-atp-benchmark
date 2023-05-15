;; sequence(s): A85002
;; terms: 1 1 0 0 0 1 1 0 0 0 1 1 1 0 0 1 1 1 0 0
;; small program: (loop((y * y) div (x - y), 1 + x, 0) + x) mod 2
;; fast program: (((1 + ((x - (x div (1 + (2 + (2 * (2 + 2)))))) + x)) div (1 + (2 + 2))) + 1) mod 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* y y) (- x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (mod (+ (v0 x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div (+ 1 (+ (- x (div x (+ 1 (+ 2 (* 2 (+ 2 2)))))) x)) (+ 1 (+ 2 2))) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
