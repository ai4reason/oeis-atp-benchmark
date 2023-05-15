;; sequence(s): A184658
;; terms: 1 2 4 6 7 9 10 12 14 15 17 19 20 22 23 25 27 28 30 32
;; small program: (loop(((y * y) div (1 + x)) + y, ((2 * (x + x)) + 2) + 1, 0) div 2) div 2
;; fast program: ((((1 + (2 - ((x - (x div (2 * (2 + 2)))) div (2 + (2 + 2))))) + x) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 1 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ (* 2 (+ x x)) 2) 1))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (div (v0 x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (+ 1 (- 2 (div (- x (div x (* 2 (+ 2 2)))) (+ 2 (+ 2 2))))) x) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
