;; sequence(s): A69173
;; terms: 1 23 67 133 221 331 463 617 793 991 1211 1453 1717 2003 2311 2641 2993 3367 3763 4181
;; small program: 1 + ((1 + x) * (loop((2 + y) * x, 2, x) - x))
;; fast program: 1 + ((1 + (2 + (2 * (2 + 2)))) * ((x * x) + x))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* (+ 1 x) (- (v0 x) x))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (+ (* x x) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
