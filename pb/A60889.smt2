;; sequence(s): A60889
;; terms: 1 1 151 4561 49981 315121 1406371 4956001 14709241 38316961 90090991 195019441 394379701 753327121 1370877691 2392743361 4027518961 6566760001 10409530951 16092043921
;; small program: loop2(1 + ((x * y) - x), y * y, 1 + 2, x, x)
;; fast program: ((1 + (((x * x) - x) * x)) * (((((x * x) * x) * x) * x) - x)) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- (* x y) x)))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (* y y))))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (* (- (* x x) x) x)) (- (* (* (* (* x x) x) x) x) x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
