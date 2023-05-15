;; sequence(s): A225569
;; terms: 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
;; small program: if loop((x - 1) mod (y + y), x, 0) <= 0 then 1 else 0
;; fast program: if (loop(x * x, 2, 1 + 2) mod (1 + x)) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (mod (- x 1) (+ y y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (ite (<= (v0 x) 0) 1 0))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod v1 (+ 1 x)) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)