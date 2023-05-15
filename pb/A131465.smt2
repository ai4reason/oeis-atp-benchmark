;; sequence(s): A131465
;; terms: 1 3 47 259 861 2171 4603 8667 14969 24211 37191 54803 78037 107979 145811 192811 250353 319907 403039 501411
;; small program: ((((loop((x - 1) + x, 2, x) * x) + 2) * (x * x)) - x) + 1
;; fast program: ((((2 + (2 * (2 * ((x * x) - x)))) + x) * (x * x)) - x) + 1
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
(assert (forall ((x Int)) (= (small x) (+ (- (* (+ (* (v0 x) x) 2) (* x x)) x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (+ (+ 2 (* 2 (* 2 (- (* x x) x)))) x) (* x x)) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
