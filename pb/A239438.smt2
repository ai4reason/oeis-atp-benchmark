;; sequence(s): A239438
;; terms: 1 1 3 4 6 7 10 12 15 19 22 26 31 35 40 46 51 57 64 70
;; small program: loop2(((((y * y) div (2 + x)) + y) div (1 + x)) + x, y, 2, 1, x)
;; fast program: ((((((if ((x - 2) - 2) <= 0 then 1 else 0) + x) * x) div (1 + 2)) + x) div 2) + 1
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
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ (div (* y y) (+ 2 x)) y) (+ 1 x)) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 2))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (div (* (+ (ite (<= (- (- x 2) 2) 0) 1 0) x) x) (+ 1 2)) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)