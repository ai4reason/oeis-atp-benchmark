;; sequence(s): A78689
;; terms: 1 2 1 1 8 1 1 14 1 1 20 1 1 26 1 1 32 1 1 38
;; small program: if ((2 + x) mod (1 + 2)) <= 0 then (x + x) else 1
;; fast program: loop2(y, 1, x mod (1 + 2), 1, x + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (mod (+ 2 x) (+ 1 2)) 0) (+ x x) 1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (mod x (+ 1 2)))))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) (+ x x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (fast x) (w0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
