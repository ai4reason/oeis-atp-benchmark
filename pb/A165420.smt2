;; sequence(s): A165420
;; terms: 1 2 2 4 16 256 65536 4294967296 18446744073709551616 340282366920938463463374607431768211456 115792089237316195423570985008687907853269984665640564039457584007913129639936
;; small program: if x <= 0 then 1 else loop(x * x, x - 2, 2)
;; fast program: loop(x * x, x - 2, if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (ite (<= x 0) 1 (v0 x)))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (forall ((x Int)) (= (g1 x) (- x 2))))
(assert (forall ((x Int)) (= (h1 x) (ite (<= x 0) 1 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
