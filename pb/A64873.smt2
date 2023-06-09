;; sequence(s): A64873-A72401
;; terms: 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0
;; small program: if ((1 + (x div loop(1, x mod (2 + 2), 2 + 2))) mod (2 * (2 + 2))) <= 0 then 1 else 0
;; fast program: if ((loop(x div loop(1, x mod 2, 2 + 2), if (x mod (2 + 2)) <= 0 then 1 else 0, x) + 1) mod (2 * (2 + 2))) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 () Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 2 2)))))
(assert (= h0 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (ite (<= (mod (+ 1 (div x (v0 x))) (* 2 (+ 2 2))) 0) 1 0))))
(assert (= f2 1))
(assert (forall ((x Int)) (= (g2 x) (mod x 2))))
(assert (= h2 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y f2))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (f1 x) (div x (v2 x)))))
(assert (forall ((x Int)) (= (g1 x) (ite (<= (mod x (+ 2 2)) 0) 1 0))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (+ (v1 x) 1) (* 2 (+ 2 2))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
