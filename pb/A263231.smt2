;; sequence(s): A263231
;; terms: 0 ~7 11 54 122 215 333 476 644 837 1055 1298 1566 1859 2177 2520 2888 3281 3699 4142
;; small program: (((loop((x * y) - 1, 2 + 2, x) + x) * x) div 2) + x
;; fast program: (((((2 * (2 * (x - 2))) + x) * x) * ((2 + 2) + 1)) + x) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* x y) 1))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (* (+ (v0 x) x) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* (* (+ (* 2 (* 2 (- x 2))) x) x) (+ (+ 2 2) 1)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
