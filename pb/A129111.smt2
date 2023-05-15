;; sequence(s): A129111
;; terms: 8 26 59 107 170 248 341 449 572 710 863 1031 1214 1412 1625 1853 2096 2354 2627 2915
;; small program: ((1 + 2) * loop(((1 + (2 + 2)) * y) + x, x, 2 + x)) + 2
;; fast program: 2 + ((1 + 2) * (2 + (((1 + (2 + 2)) * (((x * x) + x) div 2)) + x)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 1 (+ 2 2)) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 2) (v0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (* (+ 1 2) (+ 2 (+ (* (+ 1 (+ 2 2)) (div (+ (* x x) x) 2)) x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)