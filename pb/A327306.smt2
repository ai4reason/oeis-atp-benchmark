;; sequence(s): A327306
;; terms: 0 1 2 1 2 0 2 0 1 0 1 2 1 2 0 2 0 1 0 1
;; small program: ((((x div (loop((2 + y) * x, 2, 2) - 1)) + x) div (1 + 2)) + x) mod (1 + 2)
;; fast program: (((2 * (2 * (x + x))) div ((2 * (2 * (2 + (2 + 2)))) - 1)) + x) mod (1 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (mod (+ (div (+ (div x (- v0 1)) x) (+ 1 2)) x) (+ 1 2)))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div (* 2 (* 2 (+ x x))) (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1)) x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)