;; sequence(s): A158591
;; terms: 1 37 145 325 577 901 1297 1765 2305 2917 3601 4357 5185 6085 7057 8101 9217 10405 11665 12997
;; small program: 1 + (loop(2 * ((x + x) + x), 2, x) * x)
;; fast program: 1 + loop(x * x, 1, 2 * ((x + x) + x))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ (+ x x) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* (v0 x) x)))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* 2 (+ (+ x x) x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (v1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)