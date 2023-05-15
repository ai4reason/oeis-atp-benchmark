;; sequence(s): A23466
;; terms: ~24 ~23 ~22 ~21 ~20 ~19 ~18 ~17 ~16 ~15 ~14 ~13 ~12 ~11 ~10 ~9 ~8 ~7 ~6 ~5
;; small program: x - loop((2 + y) * x, 2, 2)
;; fast program: x - (2 * (2 * (2 + (2 + 2))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (- x v0))))
(assert (forall ((x Int)) (= (fast x) (- x (* 2 (* 2 (+ 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
