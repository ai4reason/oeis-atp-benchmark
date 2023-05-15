;; sequence(s): A247112
;; terms: 0 8 67 267 746 1690 3333 5957 9892 15516 23255 33583 47022 64142 85561 111945 144008 182512 228267 282131
;; small program: ((loop((2 + (x * x)) * x, 1, 1 + (x + x)) div 2) * x) div 2
;; fast program: ((((1 + (x + x)) * (1 + (2 * ((x * x) + x)))) + x) * x) div 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (+ 2 (* x x)) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 1 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (* (div (v0 x) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (* (+ 1 (+ x x)) (+ 1 (* 2 (+ (* x x) x)))) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
