;; sequence(s): A330095
;; terms: 1 3 4 6 7 9 11 12 14 15 17 19 20 22 23 25 27 28 30 31
;; small program: loop2(1 + (y - ((x div 2) div 2)), y, 2 + 2, 1, x + x)
;; fast program: loop((x div (2 * (2 * (2 + 2)))) + x, 1, (1 + 2) * (1 + x)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- y (div (div x 2) 2))))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 (+ 2 2)))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) (+ x x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (f1 x) (+ (div x (* 2 (* 2 (+ 2 2)))) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* (+ 1 2) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (v1 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
