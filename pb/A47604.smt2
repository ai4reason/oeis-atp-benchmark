;; sequence(s): A47604
;; terms: 2 3 5 10 11 13 18 19 21 26 27 29 34 35 37 42 43 45 50 51
;; small program: 2 + loop2((y mod (2 + 2)) + x, x, x + x, 0, 1)
;; fast program: (2 * ((x div (1 + 2)) + x)) + (if (x mod (1 + 2)) <= 0 then 2 else 1)
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
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod y (+ 2 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (= i0 0))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (+ 2 (w0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ (div x (+ 1 2)) x)) (ite (<= (mod x (+ 1 2)) 0) 2 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
