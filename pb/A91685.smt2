;; sequence(s): A91685
;; terms: 0 1 0 0 0 5 0 7 0 0 0 11 0 13 0 0 0 17 0 19
;; small program: if (x mod (2 + (x mod 2))) <= 0 then 0 else x
;; fast program: if loop(1 - (x mod (1 + 2)), x mod 2, x) <= 0 then x else 0
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (mod x (+ 2 (mod x 2))) 0) 0 x))))
(assert (forall ((x Int)) (= (f0 x) (- 1 (mod x (+ 1 2))))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (v0 x) 0) x 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
