;; sequence(s): A206816
;; terms: 1 9 63 447 3447 29367 276327 2856807 32250087 395130087 5225062887 74201293287 1126567808487 18213512883687 312440245683687 5668674457011687 108462341176755687 2182831421832627687 46096712669420979687
;; small program: loop((loop(x * y, y, y) * y) + x, 1 + x, 0)
;; fast program: (loop2((x * y) - 1, y - 1, x, 1 + x, 2 + x) * 2) - 1
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 (Int) Int)
(declare-fun j2 (Int) Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (v1 x y) y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (- (* x y) 1))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (- y 1))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int)) (= (i2 x) (+ 1 x))))
(assert (forall ((x Int)) (= (j2 x) (+ 2 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) (i2 x) (j2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (* (w2 x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)