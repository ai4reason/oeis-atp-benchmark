;; sequence(s): A213818
;; terms: 1 12 60 190 465 966 1792 3060 4905 7480 10956 15522 21385 28770 37920 49096 62577 78660 97660 119910
;; small program: (1 + loop(x + y, x, x)) * loop(((1 + 2) * y) + x, x, 1)
;; fast program: ((2 + ((1 + 2) * ((x * x) + x))) * ((1 + x) * (2 + x))) div (2 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* (+ 1 2) y) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (v0 x)) (v1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 2 (* (+ 1 2) (+ (* x x) x))) (* (+ 1 x) (+ 2 x))) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
