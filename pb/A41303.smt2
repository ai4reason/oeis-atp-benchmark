;; sequence(s): A41303
;; terms: 1 1 5 31 129 160 3969 4129 20485 127039 528641 655680 16264961 16920641 83947525 520605791 2166370689 2686976480 66653806209 69340782689
;; small program: loop2((((if (x mod (1 + (2 + 2))) <= 0 then (2 + (2 + 2)) else 1) * 2) * x) + y, x, x, 1, 0) div (1 + (x mod 2))
;; fast program: (loop2((((if (x mod (1 + (2 + 2))) <= 0 then (2 + (2 + 2)) else 1) * 2) * x) + y, x, x - 1, if x <= 0 then 1 else 2, 1) * (2 - (x mod 2))) div 2
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
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (* (ite (<= (mod x (+ 1 (+ 2 2))) 0) (+ 2 (+ 2 2)) 1) 2) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (div (w0 x) (+ 1 (mod x 2))))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* (* (ite (<= (mod x (+ 1 (+ 2 2))) 0) (+ 2 (+ 2 2)) 1) 2) x) y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (forall ((x Int)) (= (i1 x) (ite (<= x 0) 1 2))))
(assert (= j1 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) j1))))
(assert (forall ((x Int)) (= (fast x) (div (* (w1 x) (- 2 (mod x 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
