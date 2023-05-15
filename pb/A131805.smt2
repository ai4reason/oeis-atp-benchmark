;; sequence(s): A131805
;; terms: 0 ~1 1 0 4 3 9 8 16 15 25 24 36 35 49 48 64 63 81 80
;; small program: ((2 + (x div 2)) * (x div 2)) - x
;; fast program: loop((2 + x) * x, 1, x div 2) - x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* (+ 2 (div x 2)) (div x 2)) x))))
(assert (forall ((x Int)) (= (f0 x) (* (+ 2 x) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
