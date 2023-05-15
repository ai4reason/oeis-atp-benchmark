;; sequence(s): A190367
;; terms: 7 14 22 29 38 45 53 60 69 76 83 91 98 107 114 122 129 138 145 152
;; small program: (((((((loop(((y * y) div (2 * (2 + (x + y)))) + y, 2 + (x + x), 0) * (1 + 2)) div 2) + 2) + x) + x) + x) + x) + 2
;; fast program: ((((((((((((x - ((1 + x) div (2 + (2 * (2 + 2))))) div 2) + 2) + x) + x) * (1 + 2)) div 2) + 2) + 2) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (* 2 (+ 2 (+ x y)))) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (+ (div (* (v0 x) (+ 1 2)) 2) 2) x) x) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (div (* (+ (+ (+ (div (- x (div (+ 1 x) (+ 2 (* 2 (+ 2 2))))) 2) 2) x) x) (+ 1 2)) 2) 2) 2) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
