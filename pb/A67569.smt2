;; sequence(s): A67569
;; terms: 0 1 3 8 10
;; small program: (if (x - 2) <= 0 then (x div 2) else (2 + x)) + x
;; fast program: (if x <= 0 then 0 else (x - loop(0 - 2, x - 2, 1))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (- x 2) 0) (div x 2) (+ 2 x)) x))))
(assert (= f0 (- 0 2)))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= x 0) 0 (- x (v0 x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
