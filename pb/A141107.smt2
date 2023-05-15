;; sequence(s): A141107
;; terms: 3 5 7 11 13 15 19 21 23 27 29 31 35 37 39 41 45 47 49 53
;; small program: (((loop((y - ((x div 2) div 2)) div (1 + 2), x, 0) + x) * 2) + 1) + 2
;; fast program: 1 + (2 + (2 * (((2 * (2 + (x + x))) div (1 + (2 * (2 + (2 + 2))))) + x)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (- y (div (div x 2) 2)) (+ 1 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ (v0 x) x) 2) 1) 2))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (* 2 (+ (div (* 2 (+ 2 (+ x x))) (+ 1 (* 2 (+ 2 (+ 2 2))))) x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)