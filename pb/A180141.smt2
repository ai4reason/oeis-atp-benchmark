;; sequence(s): A180141
;; terms: 1 4 16 72 312 1368 5976 26136 114264 499608 2184408 9550872 41759064 182582424 798301656 3490399512 15261008472 66725422488 291742318296 1275579489816
;; small program: loop2(2 * (2 * ((y div 2) + x)), x - y, x, 1, 1)
;; fast program: loop2(2 * ((x + x) + y), x - y, x - 1, if x <= 0 then 1 else (2 + 2), 0)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (* 2 (+ (div y 2) x))))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (- x y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (+ x x) y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (- x y))))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (forall ((x Int)) (= (i1 x) (ite (<= x 0) 1 (+ 2 2)))))
(assert (= j1 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) j1))))
(assert (forall ((x Int)) (= (fast x) (w1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)