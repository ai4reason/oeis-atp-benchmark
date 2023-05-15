;; sequence(s): A135497
;; terms: 0 0 28 234 1008 3100 7740 16758 32704 58968 99900 160930 248688 371124 537628 759150 1048320 1419568 1889244 2475738
;; small program: (loop(x * x, 2, x) - x) * x
;; fast program: ((((x * x) * x) * x) - x) * x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (- (* (* (* x x) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
