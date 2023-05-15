;; sequence(s): A28309
;; terms: 1 1 2 3 5 6 9 11 15 18 23 27 33 38 45 51 59 66 75 83
;; small program: ((loop(((y * y) div 2) + 2, x - 2, 0) + x) div 2) + 1
;; fast program: (((((((2 + x) * x) div (2 + 2)) + (if (x - 2) <= 0 then 1 else 2)) + x) - (if x <= 0 then 1 else x)) + 1) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) 2) 2))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (v0 x) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (- (+ (- (+ (+ (div (* (+ 2 x) x) (+ 2 2)) (ite (<= (- x 2) 0) 1 2)) x) (ite (<= x 0) 1 x)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
