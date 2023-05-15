;; sequence(s): A168380
;; terms: 2 4 12 20 38 56 88 120 170 220 292 364 462 560 688 816 978 1140 1340 1540
;; small program: loop(((y div 2) * (y div 2)) + x, 2 + x, 0) * 2
;; fast program: (((((2 * (((2 + x) * x) div (2 + 2))) + x) * (2 + x)) div (1 + 2)) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (div y 2) (div y 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* (+ (* 2 (div (* (+ 2 x) x) (+ 2 2))) x) (+ 2 x)) (+ 1 2)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
