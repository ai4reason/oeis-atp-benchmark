;; sequence(s): A153814
;; terms: 1001 2002 3003 4004 5005 6006 7007 8008 9009 10010 11011 12012 13013 14014 15015 16016 17017 18018 19019 20020
;; small program: (1 + x) * (loop(2 + ((x * x) * x), 2, 2) - 1)
;; fast program: (1 + loop((x * x) * x, 1, 2 + (2 * (2 + 2)))) * (1 + x)
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
(assert (forall ((x Int)) (= (f0 x) (+ 2 (* (* x x) x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (- v0 1)))))
(assert (forall ((x Int)) (= (f1 x) (* (* x x) x))))
(assert (= g1 1))
(assert (= h1 (+ 2 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 v1) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
