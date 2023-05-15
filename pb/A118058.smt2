;; sequence(s): A118058
;; terms: 1 120 337 652 1065 1576 2185 2892 3697 4600 5601 6700 7897 9192 10585 12076 13665 15352 17137 19020
;; small program: ((loop(1 + ((2 * (x * y)) + y), 1 + 2, x) + x) * x) + 1
;; fast program: (((((1 + (2 * (2 * ((2 * (2 + x)) + x)))) * (2 + 2)) + 2) + x) * x) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ (* 2 (* x y)) y)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (v0 x) x) x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (+ (* (+ 1 (* 2 (* 2 (+ (* 2 (+ 2 x)) x)))) (+ 2 2)) 2) x) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
