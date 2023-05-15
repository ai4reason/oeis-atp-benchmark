;; sequence(s): A47434
;; terms: 0 2 4 5 6 8 10 12 13 14 16 18 20 21 22 24 26 28 29 30
;; small program: loop((((x + y) div (1 + 2)) - x) + y, x + x, 0)
;; fast program: ((x - ((0 - x) div (1 + (2 + 2)))) * (2 + 2)) div (1 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (div (+ x y) (+ 1 2)) x) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (div (* (- x (div (- 0 x) (+ 1 (+ 2 2)))) (+ 2 2)) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
