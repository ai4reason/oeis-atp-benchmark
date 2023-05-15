;; sequence(s): A345073
;; terms: 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
;; small program: (1 - (((2 - x) div (1 + 2)) div (1 + loop(x * x, 2, 2)))) + 1
;; fast program: ((((x div (1 + (2 * (2 + 2)))) + x) + x) div (1 + (2 + x))) + 2
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
(assert (forall ((x Int)) (= (small x) (+ (- 1 (div (div (- 2 x) (+ 1 2)) (+ 1 v0))) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (div x (+ 1 (* 2 (+ 2 2)))) x) x) (+ 1 (+ 2 x))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
