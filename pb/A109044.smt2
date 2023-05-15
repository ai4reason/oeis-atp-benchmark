;; sequence(s): A109044
;; terms: 0 3 6 3 12 15 6 21 24 9 30 33 12 39 42 15 48 51 18 57
;; small program: (2 * (if (x mod (1 + 2)) <= 0 then 0 else x)) + x
;; fast program: loop(1 + 2, x mod (1 + 2), 1) * x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (ite (<= (mod x (+ 1 2)) 0) 0 x)) x))))
(assert (= f0 (+ 1 2)))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (* (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
