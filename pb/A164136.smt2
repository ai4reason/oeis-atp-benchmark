;; sequence(s): A164136
;; terms: 0 22 66 132 220 330 462 616 792 990 1210 1452 1716 2002 2310 2640 2992 3366 3762 4180
;; small program: (1 + x) * (loop((2 + y) * x, 2, x) - x)
;; fast program: (1 + (2 + (2 * (2 + 2)))) * ((x * x) + x)
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
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (- (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (+ (* x x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
