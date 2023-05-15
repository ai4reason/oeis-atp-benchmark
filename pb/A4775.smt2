;; sequence(s): A4775
;; terms: 0 1 2 3 4 5 6 7 8 9 10 12 13 14 15 16 17 18 20 21
;; small program: loop((((x div 2) div 2) + y) - x, x + x, 1) - 1
;; fast program: ((1 + ((x - 2) * x)) div ((((2 + 2) + 2) * (2 + x)) + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (+ (div (div x 2) 2) y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ 1 (* (- x 2) x)) (+ (* (+ (+ 2 2) 2) (+ 2 x)) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
