;; sequence(s): A108195
;; terms: 5 13 23 35 49 65 83 103 125 149 175 203 233 265 299 335 373 413 455 499
;; small program: (2 * loop(x + y, 2 + x, x)) - 1
;; fast program: ((1 + (2 + (2 + x))) * (1 + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* 2 (v0 x)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ 2 (+ 2 x))) (+ 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
