;; sequence(s): A178710
;; terms: 0 2 11 47 193 778 3118 12480 49929 199725 798911 3195656 12782636 51130558 204522247 818089003 3272356029 13089424134 52357696554 209430786236
;; small program: loop(loop(loop2((x div (2 + 2)) + y, y + y, x + x, 0, 1), 1, y) + x, x, 0)
;; fast program: ((loop(x * x, 1, 2 * loop(x + x, x, 2)) div (1 + (2 + (2 + 2)))) - x) div (1 + 2)
(set-logic UFNIA)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
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
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (div x (+ 2 2)) y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (+ y y))))
(assert (forall ((x Int)) (= (h2 x) (+ x x))))
(assert (= i2 0))
(assert (= j2 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 j2))))
(assert (forall ((x Int)) (= (f1 x) (w2 x))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f3 x) (* x x))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (f4 x) (+ x x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 2))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (h3 x) (* 2 (v4 x)))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (fast x) (div (- (div (v3 x) (+ 1 (+ 2 (+ 2 2)))) x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)