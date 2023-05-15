;; sequence(s): A32614
;; terms: 110 211 312 413 514 615 716 817 918 1019 1120 1221 1322 1423 1524 1625 1726 1827 1928 2029
;; small program: loop(2 * ((1 + (2 + 2)) * (1 + x)), 2, x) + x
;; fast program: (2 * ((1 + (2 + 2)) * (1 + (2 * ((1 + (2 + 2)) * (1 + x)))))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (* (+ 1 (+ 2 2)) (+ 1 x))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* (+ 1 (+ 2 2)) (+ 1 (* 2 (* (+ 1 (+ 2 2)) (+ 1 x)))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
