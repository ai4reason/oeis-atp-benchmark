;; sequence(s): A171893
;; terms: 1 2 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
;; small program: (if (2 - x) <= 0 then (2 * (2 + 2)) else 1) + x
;; fast program: loop(1, 2 - x, 2 * (2 + 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (- 2 x) 0) (* 2 (+ 2 2)) 1) x))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (= h0 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
