;; sequence(s): A51869
;; terms: 0 1 17 48 94 155 231 322 428 549 685 836 1002 1183 1379 1590 1816 2057 2313 2584
;; small program: loop(((x div y) + x) + x, 2, (x * x) - x) + x
;; fast program: ((1 + 2) * ((1 + (2 + 2)) * (((x * x) - x) div 2))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div x y) x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (- (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (* (+ 1 (+ 2 2)) (div (- (* x x) x) 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
