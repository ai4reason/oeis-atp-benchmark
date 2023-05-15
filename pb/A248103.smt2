;; sequence(s): A248103
;; terms: 1 2 3 3 4 5 5 6 7 7 8 9 9 10 11 11 12 13 13 14
;; small program: (1 - ((x - (x div loop((2 * (x + x)) + x, 2, 2))) div (1 + 2))) + x
;; fast program: (1 - ((2 * (2 * (2 * (2 + (x + x))))) div (1 + (2 * (2 * (2 * (2 + (2 + 2)))))))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* 2 (+ x x)) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (- 1 (div (- x (div x v0)) (+ 1 2))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- 1 (div (* 2 (* 2 (* 2 (+ 2 (+ x x))))) (+ 1 (* 2 (* 2 (* 2 (+ 2 (+ 2 2)))))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
