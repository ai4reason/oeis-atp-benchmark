;; sequence(s): A186331
;; terms: 1 4 6 8 10 12 14 17 19 21 23 25 27 30 32 34 36 38 40 42
;; small program: (loop(((((y * y) div ((x + x) + x)) + 2) + y) + y, x + x, 1) div 2) + 1
;; fast program: ((1 - ((((x + x) div (1 + (2 * (2 + 2)))) - x) div (1 + (2 + 2)))) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (div (* y y) (+ (+ x x) x)) 2) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- 1 (div (- (div (+ x x) (+ 1 (* 2 (+ 2 2)))) x) (+ 1 (+ 2 2)))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
