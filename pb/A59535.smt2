;; sequence(s): A59535
;; terms: 1 3 4 6 8 9 11 13 14 16 18 19 21 23 24 26 27 29 31 32
;; small program: (((2 * (2 + x)) - (x div (loop(x * x, 2, 2) - 1))) div (1 + 2)) + x
;; fast program: (((2 * (2 + x)) - (x div ((2 * (2 * (2 + 2))) - 1))) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (div (- (* 2 (+ 2 x)) (div x (- v0 1))) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (* 2 (+ 2 x)) (div x (- (* 2 (* 2 (+ 2 2))) 1))) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
