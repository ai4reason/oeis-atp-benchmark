;; sequence(s): A77866
;; terms: 1 2 5 8 15 22 37 52 83 114 177 240 367 494 749 1004 1515 2026 3049 4072
;; small program: (loop2(y + y, 2 + x, x, 2, 2) - 1) - x
;; fast program: (((loop(x + x, x div 2, 1 + (2 + (x mod 2))) - 2) * 2) - 1) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ y y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 2))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (- (- (w0 x) 1) x))))
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int)) (= (g1 x) (div x 2))))
(assert (forall ((x Int)) (= (h1 x) (+ 1 (+ 2 (mod x 2))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (- (* (- (v1 x) 2) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
