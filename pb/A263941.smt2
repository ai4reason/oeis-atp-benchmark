;; sequence(s): A263941
;; terms: 1 9 13 18 22 27 31 36 40 45 49 54 58 63 67 72 76 81 85 90
;; small program: loop((x + x) + x, if x <= 0 then 1 else 2, 1 + x) div 2
;; fast program: (((1 + x) * (if x <= 0 then 1 else (2 + 2))) - (x div 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ x x) x))))
(assert (forall ((x Int)) (= (g0 x) (ite (<= x 0) 1 2))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (+ 1 x) (ite (<= x 0) 1 (+ 2 2))) (div x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
