;; sequence(s): A140113
;; terms: 1 5 8 24 29 65 72 136 145 245 256 400 413 609 624 880 897 1221 1240 1640
;; small program: loop(((if (y mod 2) <= 0 then y else 1) * y) + x, 1 + x, 0)
;; fast program: loop(loop(x * x, y mod 2, 1 + y) + x, x, 1)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (ite (<= (mod y 2) 0) y 1) y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (mod y 2))))
(assert (forall ((x Int) (y Int)) (= (h2 x y) (+ 1 y))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y) (h2 x y)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (v2 x y) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)