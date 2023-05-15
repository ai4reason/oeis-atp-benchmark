;; sequence(s): A162266
;; terms: 14 39 81 146 240 369 539 756 1026 1355 1749 2214 2756 3381 4095 4904 5814 6831 7961 9210
;; small program: (((((x * x) + (2 + loop(2 * (2 + x), 2, x))) * 2) + x) * (1 + x)) div 2
;; fast program: ((((((x * x) + (2 * (2 + (2 * (2 + x))))) + 2) * 2) + x) * (1 + x)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (* (+ (* (+ (* x x) (+ 2 (v0 x))) 2) x) (+ 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (* (+ (+ (* x x) (* 2 (+ 2 (* 2 (+ 2 x))))) 2) 2) x) (+ 1 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
