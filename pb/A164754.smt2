;; sequence(s): A164754
;; terms: 1 8 25 50 83 124 173 230 295 368 449 538 635 740 853 974 1103 1240 1385 1538
;; small program: (loop((2 + y) * y, x + x, 2) - 1) + x
;; fast program: ((2 * (2 * ((x * x) + x))) - 1) + (if x <= 0 then 2 else x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (v0 x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* 2 (* 2 (+ (* x x) x))) 1) (ite (<= x 0) 2 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)