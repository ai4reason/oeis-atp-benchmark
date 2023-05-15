;; sequence(s): A304609
;; terms: 94 208 322 436 550 664 778 892 1006 1120 1234 1348 1462 1576 1690 1804 1918 2032 2146 2260
;; small program: loop((((2 * (2 * ((x * y) + y))) + x) * y) + x, 2, x) + 2
;; fast program: (2 * ((1 + 2) * ((2 * ((2 * (2 * (2 + (x + x)))) + x)) + x))) - 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ (* 2 (* 2 (+ (* x y) y))) x) y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* (+ 1 2) (+ (* 2 (+ (* 2 (* 2 (+ 2 (+ x x)))) x)) x))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
