;; sequence(s): A168376
;; terms: 3 3 10 10 17 17 24 24 31 31 38 38 45 45 52 52 59 59 66 66
;; small program: 1 + (((loop(y - x, x, 2) + x) + x) + x)
;; fast program: 1 + (2 + ((1 + (2 + (2 + 2))) * (x div 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (+ (+ (v0 x) x) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (* (+ 1 (+ 2 (+ 2 2))) (div x 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
