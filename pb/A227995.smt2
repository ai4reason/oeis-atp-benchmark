;; sequence(s): A227995
;; terms: 1 3 25 195 1625 13879 120717 1063323 9454977 84688303 762972225 6906366907 62762167561 572251392039 5232480571761 47961608620959 440565328458621 4054586252967027 37377503512616413 345083448151227987
;; small program: loop(loop(loop2(x * y, y - 1, x, 1, 2 * (x + x)) div loop(x * y, x, 1), 1, y) - x, x, 1)
;; fast program: loop(loop((loop2(x * y, 1 + y, x - 1, 1, 2 + ((x + x) + x)) div loop(x * y, x, 1)) * (1 + ((x + x) + x)), 1, y) - x, x, 1)
(set-logic UFNIA)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 (Int) Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun i6 () Int)
(declare-fun j6 (Int) Int)
(declare-fun u6 (Int Int Int) Int)
(declare-fun v6 (Int Int Int) Int)
(declare-fun w6 (Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 () Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 (Int Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (- y 1))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (= i2 1))
(assert (forall ((x Int)) (= (j2 x) (* 2 (+ x x)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 (j2 x)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* x y))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f1 x) (div (w2 x) (v3 x)))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h6 x) (- x 1))))
(assert (= i6 1))
(assert (forall ((x Int)) (= (j6 x) (+ 2 (+ (+ x x) x)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w6 x) (u6 (h6 x) i6 (j6 x)))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (* x y))))
(assert (forall ((x Int)) (= (g7 x) x)))
(assert (= h7 1))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) h7))))
(assert (forall ((x Int)) (= (f5 x) (* (div (w6 x) (v7 x)) (+ 1 (+ (+ x x) x))))))
(assert (= g5 1))
(assert (forall ((x Int) (y Int)) (= (h5 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 g5 (h5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (- (v5 x y) x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (v4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
