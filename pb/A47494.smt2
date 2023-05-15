;; sequence(s): A47494
;; terms: 0 1 4 5 7 8 9 12 13 15 16 17 20 21 23 24 25 28 29 31
;; small program: loop((((x * y) - 2) div (2 + (2 + y))) + x, 2, x) + 2
;; fast program: (((((2 + (x + x)) div (1 + (2 + 2))) * (1 + 2)) + 1) div 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (- (* x y) 2) (+ 2 (+ 2 y))) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (* (div (+ 2 (+ x x)) (+ 1 (+ 2 2))) (+ 1 2)) 1) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
