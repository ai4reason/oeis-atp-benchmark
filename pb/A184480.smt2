;; sequence(s): A184480
;; terms: 1 2 3 5 6 7 9 10 11 13 14 15 16 18 19 20 22 23 24 26
;; small program: loop(((y * y) div (2 + ((x + y) + y))) + y, 1 + x, 0)
;; fast program: 1 + (((x - ((1 + x) div (1 + (2 + (2 * (2 + 2)))))) div (1 + 2)) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 2 (+ (+ x y) y))) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (div (- x (div (+ 1 x) (+ 1 (+ 2 (* 2 (+ 2 2)))))) (+ 1 2)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
