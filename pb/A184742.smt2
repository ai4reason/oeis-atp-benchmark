;; sequence(s): A184742
;; terms: 1 3 4 6 8 10 11 13 15 17 18 20 22 24 26 27 29 31 33 34
;; small program: (((loop((((x div (1 + 2)) div 2) + y) - x, x, 0) + x) div 2) + x) + 1
;; fast program: (((2 - ((x - (x div (1 + (2 + (2 * (2 + 2)))))) div 2)) div 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (+ (div (div x (+ 1 2)) 2) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (v0 x) x) 2) x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- 2 (div (- x (div x (+ 1 (+ 2 (* 2 (+ 2 2)))))) 2)) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
