;; sequence(s): A5920
;; terms: 1 9 33 82 165 291 469 708 1017 1405 1881 2454 3133 3927 4845 5896 7089 8433 9937 11610
;; small program: (((x * x) + loop(x + y, 2 + x, x)) * x) + 1
;; fast program: ((1 + x) * (2 + (((2 * (2 + x)) + x) * x))) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (* x x) (v0 x)) x) 1))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 x) (+ 2 (* (+ (* 2 (+ 2 x)) x) x))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
