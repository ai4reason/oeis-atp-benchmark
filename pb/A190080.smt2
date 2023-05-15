;; sequence(s): A190080
;; terms: 3 7 10 14 18 22 25 29 33 37 40 44 48 52 55 59 63 67 71 74
;; small program: (((((((((1 + ((1 + x) div (loop(x * x, 2, 2) + 2))) + x) div 2) + x) div 2) + 1) + x) + 2) + x) + x
;; fast program: ((((((((((1 + x) div ((2 * (2 * (2 + 2))) + 2)) - x) + 1) div (2 + 2)) + 1) + x) + x) + x) + x) + 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (div (+ (div (+ (+ 1 (div (+ 1 x) (+ v0 2))) x) 2) x) 2) 1) x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (div (+ (- (div (+ 1 x) (+ (* 2 (* 2 (+ 2 2))) 2)) x) 1) (+ 2 2)) 1) x) x) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
