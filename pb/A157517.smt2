;; sequence(s): A157517
;; terms: 7 13 7 ~11 ~41 ~83 ~137 ~203 ~281 ~371 ~473 ~587 ~713 ~851 ~1001 ~1163 ~1337 ~1523 ~1721 ~1931
;; small program: loop(((x + y) * y) + x, 2, (2 - x) * x)
;; fast program: 1 + (2 * ((1 + 2) * (1 + ((2 - x) * x))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ x y) y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (* (- 2 x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (* (+ 1 2) (+ 1 (* (- 2 x) x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
