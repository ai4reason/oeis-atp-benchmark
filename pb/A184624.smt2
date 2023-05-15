;; sequence(s): A184624
;; terms: 1 2 3 5 6 8 9 11 12 13 15 16 18 19 20 22 23 25 26 28
;; small program: (loop(1 + ((y * y) div ((x + y) + y)), x - 2, 0) + x) + 1
;; fast program: (((((2 * (2 * (2 * (2 + x)))) div (1 + (2 * (2 * (2 * (2 + 2)))))) + x) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (div (* y y) (+ (+ x y) y))))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (div (* 2 (* 2 (* 2 (+ 2 x)))) (+ 1 (* 2 (* 2 (* 2 (+ 2 2)))))) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
