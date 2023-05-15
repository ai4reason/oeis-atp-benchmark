;; sequence(s): A290856
;; terms: 1 1 1 1 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11
;; small program: 1 + ((2 + (2 * (2 + 2))) mod (1 + (x * x)))
;; fast program: 1 + loop(0, 2 + (2 - x), 2 + (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (mod (+ 2 (* 2 (+ 2 2))) (+ 1 (* x x)))))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (- 2 x)))))
(assert (= h0 (+ 2 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (v0 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
