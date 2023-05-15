;; sequence(s): A76459
;; terms: 1 57 390 1510 4335 10311 21532 40860 72045 119845 190146 290082 428155 614355 860280 1179256 1586457 2099025 2736190 3519390
;; small program: ((((loop((x * x) - x, 2, 2 + x) * 2) - 2) - x) * (1 + x)) div 2
;; fast program: (1 + ((2 * ((2 + x) * x)) * (2 + x))) * (((1 + x) * (2 + x)) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- (* x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (* (- (- (* (v0 x) 2) 2) x) (+ 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* (* 2 (* (+ 2 x) x)) (+ 2 x))) (div (* (+ 1 x) (+ 2 x)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
