;; sequence(s): A8610
;; terms: 1 1 3 5 10 14 22 30 43 55 73 91 116 140 172 204 245 285 335 385
;; small program: loop(((y div 2) * (y div 2)) + x, 2 + x, 1) div 2
;; fast program: ((((((2 * (((2 + x) * x) div (2 + 2))) + x) * (2 + x)) div (1 + 2)) + x) div (2 + 2)) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (div y 2) (div y 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (div (* (+ (* 2 (div (* (+ 2 x) x) (+ 2 2))) x) (+ 2 x)) (+ 1 2)) x) (+ 2 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
