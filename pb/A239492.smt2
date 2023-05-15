;; sequence(s): A239492
;; terms: 0 0 2 3 4 6 6 8 9 10 12 12 14 15 16 18 18 20 21 22
;; small program: loop((((x - 2) + y) div (1 + 2)) - x, x, 0) + x
;; fast program: (((2 * ((0 - x) div (1 + (2 + 2)))) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (div (+ (- x 2) y) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (* 2 (div (- 0 x) (+ 1 (+ 2 2)))) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
