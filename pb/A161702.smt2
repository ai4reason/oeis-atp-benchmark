;; sequence(s): A161702
;; terms: 1 2 7 14 21 26 27 22 9 ~14 ~49 ~98 ~163 ~246 ~349 ~474 ~623 ~798 ~1001 ~1234
;; small program: loop(((2 + ((1 + 2) - y)) * y) + x, x - 1, 1) + x
;; fast program: (((((2 * (2 + 2)) - x) * ((x * x) - x)) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 2 (- (+ 1 2) y)) y) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* (- (* 2 (+ 2 2)) x) (- (* x x) x)) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
