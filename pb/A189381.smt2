;; sequence(s): A189381
;; terms: 8 17 27 36 46 54 63 73 82 92 101 109 119 128 138 147 157 165 174 184
;; small program: ((((loop((((y * y) div (1 + (2 + x))) + y) + y, 2 + (x + x), 0) * (1 + 2)) div 2) + 2) + x) + x
;; fast program: (((((((((((((((2 * (2 + (x + x))) + (x div (1 + (2 + (2 + 2))))) div (1 + (2 + 2))) + 2) + x) + x) * (1 + 2)) div 2) + 2) + x) + 1) + x) + 2) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (* y y) (+ 1 (+ 2 x))) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (* (v0 x) (+ 1 2)) 2) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (+ (+ (div (* (+ (+ (+ (div (+ (* 2 (+ 2 (+ x x))) (div x (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2))) 2) x) x) (+ 1 2)) 2) 2) x) 1) x) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
