;; sequence(s): A154617
;; terms: 0 11 66 165 308 495 726 1001 1320 1683 2090 2541 3036 3575 4158 4785 5456 6171 6930 7733
;; small program: ((x - 1) + x) * (loop((2 + y) * x, 2, x) - x)
;; fast program: (1 + (2 + (2 * (2 + 2)))) * ((2 * (x * x)) - x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (- x 1) x) (- (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (- (* 2 (* x x)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
