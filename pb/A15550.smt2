;; sequence(s): A15550
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; small program: (2 - ((x - 1) div (2 + loop(2 * (2 + x), 2, 2)))) div 2
;; fast program: ((1 + (x div (2 - (2 * (2 * (2 + (2 + 2))))))) div 2) + 1
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
(assert (forall ((x Int)) (= (small x) (div (- 2 (div (- x 1) (+ 2 v0))) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ 1 (div x (- 2 (* 2 (* 2 (+ 2 (+ 2 2))))))) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
