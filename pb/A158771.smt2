;; sequence(s): A158771
;; terms: 77 311 701 1247 1949 2807 3821 4991 6317 7799 9437 11231 13181 15287 17549 19967 22541 25271 28157 31199
;; small program: ((1 + ((2 + x) * x)) * (loop((2 + x) * x, 2, 2) - 2)) - 1
;; fast program: ((1 + ((2 + x) * x)) * loop((2 * (x * x)) + x, 1, 2 + (2 + 2))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (+ 2 x) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 (* (+ 2 x) x)) (- v0 2)) 1))))
(assert (forall ((x Int)) (= (f1 x) (+ (* 2 (* x x)) x))))
(assert (= g1 1))
(assert (= h1 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (* (+ 2 x) x)) v1) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)