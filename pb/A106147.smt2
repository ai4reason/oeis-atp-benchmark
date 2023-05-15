;; sequence(s): A106147
;; terms: 1 4 4 3 4 3 3 2 4 3 3 2 3 2 2 1 4 3 3 2
;; small program: 1 + ((loop2(x + y, y div 2, x, x, x) + x) mod (2 + 2))
;; fast program: ((0 - loop2(x - y, y div 2, 2 + (2 + 2), x, x div 2)) mod (2 + 2)) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (div y 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (mod (+ (w0 x) x) (+ 2 2))))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (div y 2))))
(assert (= h1 (+ 2 (+ 2 2))))
(assert (forall ((x Int)) (= (i1 x) x)))
(assert (forall ((x Int)) (= (j1 x) (div x 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 h1 (i1 x) (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (mod (- 0 (w1 x)) (+ 2 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
