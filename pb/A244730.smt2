;; sequence(s): A244730
;; terms: 0 2 32 162 512 1250 2592 4802 8192 13122 20000 29282 41472 57122 76832 101250 131072 167042 209952 260642
;; small program: 2 * loop(x * x, 2, x)
;; fast program: 2 * (((x * x) * x) * x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* 2 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* (* (* x x) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)