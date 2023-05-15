;; sequence(s): A334706
;; terms: 4 8 20 44 84 140 224 332 472 648 864 1120 1428 1784 2196 2668 3204 3804 4480 5228
;; small program: (((((1 + loop((y * y) + x, x, x)) * (2 + x)) div 2) div (1 + x)) * 2) * 2
;; fast program: (((((((1 + (x + x)) * ((2 + x) * x)) div (2 + (2 + 2))) + x) div 2) * 2) + 2) * 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (* (div (div (* (+ 1 (v0 x)) (+ 2 x)) 2) (+ 1 x)) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* (div (+ (div (* (+ 1 (+ x x)) (* (+ 2 x) x)) (+ 2 (+ 2 2))) x) 2) 2) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
