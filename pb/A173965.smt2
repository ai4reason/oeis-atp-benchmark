;; sequence(s): A173965
;; terms: 2 9 25 56 108 187 299 450 646 893 1197 1564 2000 2511 3103 3782 4554 5425 6401 7488
;; small program: (1 + (x + x)) * loop(x + y, x, 2)
;; fast program: (1 + (x + x)) * (2 + (((x * x) + x) div 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (+ x x)) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ x x)) (+ 2 (div (+ (* x x) x) 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)