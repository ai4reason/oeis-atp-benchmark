;; sequence(s): A329839
;; terms: 1 2 4 5 6 8 9 10 12 13 14 16 17 18 20 21 22 24 25 27
;; small program: (((1 + ((x - ((x div 2) div 2)) + x)) div (1 + (2 + 2))) + 1) + x
;; fast program: ((1 + x) * loop((x * x) * x, 1, 1 + 2)) div (2 * (2 + (2 * (2 + 2))))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ 1 (+ (- x (div (div x 2) 2)) x)) (+ 1 (+ 2 2))) 1) x))))
(assert (forall ((x Int)) (= (f0 x) (* (* x x) x))))
(assert (= g0 1))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 x) v0) (* 2 (+ 2 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)