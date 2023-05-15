;; sequence(s): A302203
;; terms: 1 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1
;; small program: ((((((x div 2) + x) + x) + x) div loop(1 + (x + x), 2, 2)) + 1) mod 2
;; fast program: ((((2 * ((x + x) + x)) + x) div (2 + (2 * (2 + (2 * (2 + 2)))))) + 1) mod 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (mod (+ (div (+ (+ (+ (div x 2) x) x) x) v0) 1) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div (+ (* 2 (+ (+ x x) x)) x) (+ 2 (* 2 (+ 2 (* 2 (+ 2 2)))))) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
