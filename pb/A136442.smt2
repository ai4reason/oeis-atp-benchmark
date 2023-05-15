;; sequence(s): A136442
;; terms: 1 1 0 1 1 0 1 0 0 1 1 0 1 1 0 1 0 0 1 1
;; small program: loop2(((((y + y) div x) mod (1 + 2)) + 1) * x, y, x, 1, x) mod 2
;; fast program: if ((loop(if ((2 + x) mod (1 + 2)) <= 0 then (x div (1 + 2)) else x, 1 + 2, x) mod (1 + 2)) - 1) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (mod (div (+ y y) x) (+ 1 2)) 1) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (mod (w0 x) 2))))
(assert (forall ((x Int)) (= (f1 x) (ite (<= (mod (+ 2 x) (+ 1 2)) 0) (div x (+ 1 2)) x))))
(assert (= g1 (+ 1 2)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (mod (v1 x) (+ 1 2)) 1) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
