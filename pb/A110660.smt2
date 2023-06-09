;; sequence(s): A110660
;; terms: 0 0 2 2 6 6 12 12 20 20 30 30 42 42 56 56 72 72 90 90
;; small program: (1 + (x div 2)) * (x div 2)
;; fast program: loop((x * x) + x, 1, x div 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 (div x 2)) (div x 2)))))
(assert (forall ((x Int)) (= (f0 x) (+ (* x x) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
