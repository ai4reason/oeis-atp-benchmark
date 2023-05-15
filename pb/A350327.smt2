;; sequence(s): A350327
;; terms: 1 2 2 2 3 3 3 4 4 4 5 5 6 6 6 7 7 8 8 8
;; small program: ((1 + (loop(y, x div (1 + (2 + 2)), 1) + x)) div (1 + 2)) + 1
;; fast program: (((((if ((x - 2) - 2) <= 0 then 2 else 1) + x) * 2) - 1) div (1 + (2 + 2))) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (div x (+ 1 (+ 2 2))))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ 1 (+ (v0 x) x)) (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (* (+ (ite (<= (- (- x 2) 2) 0) 2 1) x) 2) 1) (+ 1 (+ 2 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
