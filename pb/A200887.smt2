;; sequence(s): A200887
;; terms: 12 51 144 325 636 1127 1856 2889 4300 6171 8592 11661 15484 20175 25856 32657 40716 50179 61200 73941
;; small program: loop((((y * y) - 1) + x) + y, 2 + x, 0) * (2 + x)
;; fast program: loop(((((x + 2) * x) - 1) + x) * (x * x), 1, 2 + x) div (1 + 2)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (- (* y y) 1) x) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (+ 2 x)))))
(assert (forall ((x Int)) (= (f1 x) (* (+ (- (* (+ x 2) x) 1) x) (* x x)))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (v1 x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)