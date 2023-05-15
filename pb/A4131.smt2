;; sequence(s): A4131
;; terms: 1 3 6 9 13 17 24 30 36 42
;; small program: ((loop((((x div 2) div 2) + x) * x, 1, 2 + x) - x) div (2 + 2)) + x
;; fast program: (((((x - ((1 - x) div (2 + 2))) * (2 + x)) + x) div (2 + 2)) + x) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (+ (div (div x 2) 2) x) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (- (v0 x) x) (+ 2 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* (- x (div (- 1 x) (+ 2 2))) (+ 2 x)) x) (+ 2 2)) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
