;; sequence(s): A60008
;; terms: 0 0 0 0 9 45 135 315 630 1134 1890 2970 4455 6435 9009 12285 16380 21420 27540 34884
;; small program: loop(((x * x) - x) div 2, 2, 2 - x) * (1 + 2)
;; fast program: ((loop(((x * x) * x) - x, 1, x - 2) * x) div (2 * (2 + 2))) * (1 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (- (* x x) x) 2))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (- 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (+ 1 2)))))
(assert (forall ((x Int)) (= (f1 x) (- (* (* x x) x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (- x 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (div (* (v1 x) x) (* 2 (+ 2 2))) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
