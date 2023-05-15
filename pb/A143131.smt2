;; sequence(s): A143131
;; terms: 1 5 19 63 157 321 575 939 1433 2077 2891 3895 5109 6553 8247 10211 12465 15029 17923 21167
;; small program: ((loop(((1 + (2 + 2)) * (y * y)) + x, x - 1, x) + x) * 2) + 1
;; fast program: (((((((x - 1) + x) * ((x * x) - x)) div (1 + 2)) + x) * (1 + (2 + 2))) - x) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 1 (+ 2 2)) (* y y)) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (v0 x) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (+ (div (* (+ (- x 1) x) (- (* x x) x)) (+ 1 2)) x) (+ 1 (+ 2 2))) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
