;; sequence(s): A307621
;; terms: 1 6 22 63 151 316 596 1037 1693 2626 3906 5611 7827 10648 14176 18521 23801 30142 37678 46551
;; small program: ((((2 * (loop(((y * y) - y) + x, x, x) + x)) + x) * (1 + x)) div 2) + 1
;; fast program: (((1 + (2 * (2 + (2 + (2 + (x * x)))))) * ((x * x) + x)) div (2 + (2 + 2))) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* y y) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (* (+ (* 2 (+ (v0 x) x)) x) (+ 1 x)) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* (+ 1 (* 2 (+ 2 (+ 2 (+ 2 (* x x)))))) (+ (* x x) x)) (+ 2 (+ 2 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
