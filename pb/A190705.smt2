;; sequence(s): A190705
;; terms: 0 18 120 378 864 1650 2808 4410 6528 9234 12600 16698 21600 27378 34104 41850 50688 60690 71928 84474
;; small program: (loop(((2 + y) * x) + y, 2, x) * x) * x
;; fast program: 2 * ((1 + 2) * ((1 + (x + x)) * (x * x)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 2 y) x) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (* (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* (+ 1 2) (* (+ 1 (+ x x)) (* x x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
