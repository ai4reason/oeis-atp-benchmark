;; sequence(s): A198268
;; terms: 0 3 7 10 14 17 21 24 28 31 35 38 42 45 48 52 55 59 62 66
;; small program: ((((x - (x div (loop(x * x, 2, 2) - 2))) div 2) + x) + x) + x
;; fast program: ((((x - (x div (2 + (2 * (2 + (2 + 2)))))) div 2) + x) + x) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (- x (div x (- v0 2))) 2) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (- x (div x (+ 2 (* 2 (+ 2 (+ 2 2)))))) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)