;; sequence(s): A194
;; terms: 0 1 1 2 2 2 2 3 3 3 3 3 3 4 4 4 4 4 4 4
;; small program: loop((x - (y div (0 - x))) div 2, x, x)
;; fast program: loop2(loop(x + y, x, y) div (2 + x), y, 1 + 2, 2, (x - 2) - (x div 2)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (- x (div y (- 0 x))) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ x y))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int) (y Int)) (= (h2 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x) (h2 x y)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (div (v2 x y) (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 (+ 1 2)))
(assert (= i1 2))
(assert (forall ((x Int)) (= (j1 x) (- (- x 2) (div x 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 h1 i1 (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (w1 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
