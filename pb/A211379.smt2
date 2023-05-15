;; sequence(s): A211379
;; terms: 0 0 0 3 7 16 27 45 66 96 130 175 225 288 357 441 532 640 756 891
;; small program: ((((x - 1) div 2) * ((1 + 2) + x)) * (x div 2)) div 2
;; fast program: loop((((x * x) div (2 + 2)) + x) * x, 1, x - 1) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (* (* (div (- x 1) 2) (+ (+ 1 2) x)) (div x 2)) 2))))
(assert (forall ((x Int)) (= (f0 x) (* (+ (div (* x x) (+ 2 2)) x) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (- x 1))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
