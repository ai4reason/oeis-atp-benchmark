;; sequence(s): A27942
;; terms: 1 11 51 176 530 1490 4043 10773 28445 74770 196116 513876 1345861 3524111 9226935 24157220 63245318 165579398 433493615 1134902265
;; small program: loop(loop(loop2(2 + (x + y), x, y, 1, 0) + x, y + y, x), x, 1) + x
;; fast program: loop(((loop2(x + y, x, x + x, 2, 1) - ((x + x) * x)) - x) - x, 1, 2 + x) + x
(set-logic UFNIA)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun i4 () Int)
(declare-fun j4 () Int)
(declare-fun u4 (Int Int Int) Int)
(declare-fun v4 (Int Int Int) Int)
(declare-fun w4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int) (y Int)) (= (h2 x y) y)))
(assert (= i2 1))
(assert (= j2 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w2 x y) (u2 (h2 x y) i2 j2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (w2 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ y y))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ x y))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (forall ((x Int)) (= (h4 x) (+ x x))))
(assert (= i4 2))
(assert (= j4 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u4 x y z) (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v4 x y z) (ite (<= x 0) z (g4 (u4 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w4 x) (u4 (h4 x) i4 j4))))
(assert (forall ((x Int)) (= (f3 x) (- (- (- (w4 x) (* (+ x x) x)) x) x))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v3 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
