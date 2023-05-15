;; sequence(s): A187971
;; terms: 2 7 12 14 19 24 26 31 36 41 43 48 53 55 60 65 70 72 77 82
;; small program: (((loop(((((y * y) div 2) + y) div (x * x)) + x, x, 1) + x) * (1 + 2)) - 1) - x
;; fast program: (((((((((2 * (2 + (x + x))) div (1 + (2 * (2 * (2 * (2 + 2)))))) + 2) + x) + x) div (1 + 2)) * (1 + 2)) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ (div (* y y) 2) y) (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (- (* (+ (v0 x) x) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (* (div (+ (+ (+ (div (* 2 (+ 2 (+ x x))) (+ 1 (* 2 (* 2 (* 2 (+ 2 2)))))) 2) x) x) (+ 1 2)) (+ 1 2)) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
