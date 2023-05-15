;; sequence(s): A57349
;; terms: 3 6 8 11 14 17 19 22 25 27 30 33 36 38 41 44 46 49 52 55
;; small program: (loop((((2 - (x div (1 + 2))) div 2) + y) + y, x, 1) + x) + 2
;; fast program: ((2 * (2 * ((1 + 2) * (2 + x)))) div (1 + (2 + (2 + 2)))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (- 2 (div x (+ 1 2))) 2) y) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* 2 (* 2 (* (+ 1 2) (+ 2 x)))) (+ 1 (+ 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
