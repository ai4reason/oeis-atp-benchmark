;; sequence(s): A315750
;; terms: 1 6 12 18 23 29 35 41 46 52 58 64 70 76 82 87 93 99 105 110
;; small program: (((((((loop(((y * y) div (2 + x)) + y, (2 * (x + x)) + x, 1) * (1 + 2)) + 1) + x) div 2) + 1) + x) div 2) - x
;; fast program: (((((((((((((2 * (2 * (x + x))) div (1 + (2 + (2 * (2 + 2))))) + x) * 2) + 1) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + 1) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ (* 2 (+ x x)) x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (div (+ (+ (div (+ (+ (* (v0 x) (+ 1 2)) 1) x) 2) 1) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ (+ (- (+ (* (+ (div (* 2 (* 2 (+ x x))) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) 2) 1) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 1) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
