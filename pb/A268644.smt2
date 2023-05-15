;; sequence(s): A268644
;; terms: ~1 ~2 15 74 199 414 743 1210 1839 2654 3679 4938 6455 8254 10359 12794 15583 18750 22319 26314
;; small program: (((loop((x - 1) + x, 2, x) * x) - 2) * x) - 1
;; fast program: (((1 + (2 * (x + x))) * ((x * x) - x)) - 1) - x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (- x 1) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (- (* (v0 x) x) 2) x) 1))))
(assert (forall ((x Int)) (= (fast x) (- (- (* (+ 1 (* 2 (+ x x))) (- (* x x) x)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
