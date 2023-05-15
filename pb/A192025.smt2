;; sequence(s): A192025
;; terms: 4 29 84 178 320 519 784 1124 1548 2065 2684 3414 4264 5243 6360 7624 9044 10629 12388 14330
;; small program: ((loop(2 + (((x + y) + y) + y), 2 + x, x) * x) + 2) + 2
;; fast program: ((((2 + ((2 + (2 + (2 + x))) * x)) * (1 + 2)) + 2) * (1 + x)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (+ (+ x y) y) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (v0 x) x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (* (+ 2 (* (+ 2 (+ 2 (+ 2 x))) x)) (+ 1 2)) 2) (+ 1 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
