;; sequence(s): A152457
;; terms: 0 3 17 56 140 295 553 952 1536 2355 3465 4928 6812 9191 12145 15760 20128 25347 31521 38760
;; small program: loop((((1 + y) * (y * y)) + x) + y, x, 0)
;; fast program: ((((x * x) * x) - x) div (1 + 2)) + loop((2 + x) * x, 1, ((x * x) + x) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* (+ 1 y) (* y y)) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (* (+ 2 x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (div (+ (* x x) x) 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (* (* x x) x) x) (+ 1 2)) (v1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
