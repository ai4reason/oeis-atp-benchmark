;; sequence(s): A144917
;; terms: 1 3 7 13 19 25 31 37 43 49 55 61 67 73 79 85 91 97 103 109
;; small program: 1 + (2 * loop((y + y) + y, x - 1, x))
;; fast program: ((loop(1, 2 - x, (x - 2) + x) + x) * 2) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ y y) y))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* 2 (v0 x))))))
(assert (= f1 1))
(assert (forall ((x Int)) (= (g1 x) (- 2 x))))
(assert (forall ((x Int)) (= (h1 x) (+ (- x 2) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (v1 x) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)