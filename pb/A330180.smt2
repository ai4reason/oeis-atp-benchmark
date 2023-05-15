;; sequence(s): A330180
;; terms: 1 3 6 7 10 12 15 16 19 21 24 25 28 30 31 34 36 39 40 43
;; small program: ((1 + (loop((y - ((x div 2) div (1 + 2))) div 2, x, 0) + x)) * (1 + 2)) div 2
;; fast program: ((1 + (((x - (x div (1 + (2 * (2 + (2 + 2)))))) div 2) + x)) * (1 + 2)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (- y (div (div x 2) (+ 1 2))) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (* (+ 1 (+ (v0 x) x)) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 (+ (div (- x (div x (+ 1 (* 2 (+ 2 (+ 2 2)))))) 2) x)) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
