;; sequence(s): A61570
;; terms: 0 1 8 11 14 17 20 23 26 29 32 35 38 41 44 47 50 53 56 59
;; small program: ((1 + x) * (2 mod (1 + x))) + x
;; fast program: (2 * loop(0, 2 - x, 1 + x)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 x) (mod 2 (+ 1 x))) x))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (v0 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
