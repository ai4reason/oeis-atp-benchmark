;; sequence(s): A172328
;; terms: 0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95
;; small program: ((2 * (x + x)) + (x div (1 + loop(2 * (2 + x), 2, 2)))) + x
;; fast program: ((2 * (x + x)) + (x div (1 + (2 * (2 + (2 * (2 + 2))))))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (* 2 (+ x x)) (div x (+ 1 v0))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* 2 (+ x x)) (div x (+ 1 (* 2 (+ 2 (* 2 (+ 2 2))))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
