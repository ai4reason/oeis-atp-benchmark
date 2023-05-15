;; sequence(s): A8672
;; terms: 1 1 1 2 2 3 4 4 5 6 7 8 9 10 11 13 14 15 17 18
;; small program: (((loop(x + y, x, x) div (1 + 2)) + x) div (1 + (2 + 2))) + 1
;; fast program: 1 + (((((x * x) - x) div (2 + (2 * (2 + 2)))) + x) div (1 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (div (v0 x) (+ 1 2)) x) (+ 1 (+ 2 2))) 1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (div (+ (div (- (* x x) x) (+ 2 (* 2 (+ 2 2)))) x) (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
