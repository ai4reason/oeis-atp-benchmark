;; sequence(s): A186030
;; terms: 0 5 23 54 98 155 225 308 404 513 635 770 918 1079 1253 1440 1640 1853 2079 2318
;; small program: ((loop(1 - ((2 + y) * x), 2, x) + x) * x) div 2
;; fast program: ((((1 + 2) * ((2 * (x + x)) - 1)) + x) * x) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- 1 (* (+ 2 y) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (* (+ (v0 x) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (* (+ 1 2) (- (* 2 (+ x x)) 1)) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
