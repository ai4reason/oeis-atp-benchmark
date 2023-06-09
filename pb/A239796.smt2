;; sequence(s): A239796
;; terms: ~6 17 54 105 170 249 342 449 570 705 854 1017 1194 1385 1590 1809 2042 2289 2550 2825
;; small program: (loop((x - 1) + x, 2, (2 + x) * x) * 2) - (x * x)
;; fast program: (2 + (2 * ((((2 + x) * x) - 1) * (2 + 2)))) - (x * x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (- x 1) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (* (+ 2 x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (v0 x) 2) (* x x)))))
(assert (forall ((x Int)) (= (fast x) (- (+ 2 (* 2 (* (- (* (+ 2 x) x) 1) (+ 2 2)))) (* x x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
