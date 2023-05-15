;; sequence(s): A6071
;; terms: 1 4 14 38 76 136 218 330 472 652 870 1134 1444 1808 2226 2706 3248 3860 4542 5302
;; small program: ((loop(((y * y) + x) + y, x, 1) - (x div 2)) * 2) - (if x <= 0 then 1 else 2)
;; fast program: (((((((1 + x) * ((2 + x) * x)) div (1 + 2)) * 2) - (if x <= 0 then 0 else 1)) - x) + 1) + (x mod 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* y y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (- (v0 x) (div x 2)) 2) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (- (* (div (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2)) 2) (ite (<= x 0) 0 1)) x) 1) (mod x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)