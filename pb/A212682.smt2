;; sequence(s): A212682
;; terms: 0 1 12 57 168 395 792 1435 2400 3789 5700 8261 11592 15847 21168 27735 35712 45305 56700 70129
;; small program: (loop((((y * y) * y) - x) + y, x, 0) - x) * x
;; fast program: ((1 + ((2 + x) * ((2 * (x * x)) - x))) div (2 + 2)) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* (* y y) y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (- (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (div (+ 1 (* (+ 2 x) (- (* 2 (* x x)) x))) (+ 2 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
