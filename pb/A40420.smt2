;; sequence(s): A40420
;; terms: 21 42 42 42 42 42 42 42 42 42 42 42 42 42 42 42 42 42 42 42
;; small program: loop((x * x) + x, 2, 2) div (if x <= 0 then 2 else 1)
;; fast program: (1 + 2) * ((1 + (2 + (2 + 2))) * (if x <= 0 then 1 else 2))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* x x) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (div v0 (ite (<= x 0) 2 1)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (* (+ 1 (+ 2 (+ 2 2))) (ite (<= x 0) 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
