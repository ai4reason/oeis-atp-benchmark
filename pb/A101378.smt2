;; sequence(s): A101378
;; terms: 0 1 18 126 520 1575 3906 8428 16416 29565 50050 80586 124488 185731 269010 379800 524416 710073 944946 1238230
;; small program: ((loop(x * x, 2, x) + x) div 2) * x
;; fast program: (((((x * x) * x) * x) + x) div 2) * x
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
(assert (forall ((x Int)) (= (small x) (* (div (+ (v0 x) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (* (div (+ (* (* (* x x) x) x) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
