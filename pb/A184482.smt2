;; sequence(s): A184482
;; terms: 1 2 4 5 6 8 9 10 11 13 14 15 17 18 19 21 22 23 24 26
;; small program: loop((((y * y) div (((x + 2) + y) + y)) + 2) + y, x - 1, x) + 1
;; fast program: ((((((1 + ((x div (2 * (2 + (2 * (2 + 2))))) + x)) div (1 + (2 + 2))) + 2) + x) div (2 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (* y y) (+ (+ (+ x 2) y) y)) 2) y))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (div (+ 1 (+ (div x (* 2 (+ 2 (* 2 (+ 2 2))))) x)) (+ 1 (+ 2 2))) 2) x) (+ 2 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)