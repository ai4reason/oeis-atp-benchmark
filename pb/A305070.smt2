;; sequence(s): A305070
;; terms: 324 1404 3240 5832 9180 13284 18144 23760 30132 37260 45144 53784 63180 73332 84240 95904 108324 121500 135432 150120
;; small program: (((loop(2 * ((x + x) + y), 1 + 2, x) - x) * 2) * (1 + 2)) * (1 + x)
;; fast program: (2 * ((1 + x) * loop((x * x) * x, 1, 1 + 2))) * ((2 * ((1 + 2) * (1 + x))) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ (+ x x) y)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (* (* (- (v0 x) x) 2) (+ 1 2)) (+ 1 x)))))
(assert (forall ((x Int)) (= (f1 x) (* (* x x) x))))
(assert (= g1 1))
(assert (= h1 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (* (* 2 (* (+ 1 x) v1)) (+ (* 2 (* (+ 1 2) (+ 1 x))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
