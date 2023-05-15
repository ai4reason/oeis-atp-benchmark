;; sequence(s): A280569
;; terms: 1 ~1 1 ~1 1 ~2 1 ~1 1 ~1 2 ~1 1 ~1 1 ~2 1 ~1 1 ~1
;; small program: (if ((if x <= 0 then 1 else x) mod (1 + (2 + 2))) <= 0 then 2 else 1) * loop(0 - x, x, 1)
;; fast program: (if (x mod (1 + (2 + 2))) <= 0 then (if x <= 0 then 1 else 2) else 1) * loop(0 - x, x mod 2, 1)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 0 x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (ite (<= (mod (ite (<= x 0) 1 x) (+ 1 (+ 2 2))) 0) 2 1) (v0 x)))))
(assert (forall ((x Int)) (= (f1 x) (- 0 x))))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (* (ite (<= (mod x (+ 1 (+ 2 2))) 0) (ite (<= x 0) 1 2) 1) (v1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
