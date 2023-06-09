;; sequence(s): A109007
;; terms: 3 1 1 3 1 1 3 1 1 3 1 1 3 1 1 3 1 1 3 1
;; small program: 1 + (if (x mod (1 + 2)) <= 0 then 2 else 0)
;; fast program: 1 + loop(0, x mod (1 + 2), 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (ite (<= (mod x (+ 1 2)) 0) 2 0)))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (v0 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
