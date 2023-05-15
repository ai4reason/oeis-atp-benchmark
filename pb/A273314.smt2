;; sequence(s): A273314
;; terms: 1 6 23 64 137 250 411 628 909 1262 1695 2216 2833 3554 4387 5340 6421 7638 8999 10512
;; small program: (((((((((loop(((y * y) + x) + y, x, 1) - x) + 1) * (if x <= 0 then 1 else 2)) * 2) - 1) - x) - x) - 1) - x) - 1
;; fast program: (((((((((((x * x) * x) - x) div (1 + 2)) + (x * x)) * 2) + (if x <= 0 then 1 else 2)) - x) + 1) * (if x <= 0 then 1 else 2)) - 1) - x
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
(assert (forall ((x Int)) (= (small x) (- (- (- (- (- (- (* (* (+ (- (v0 x) x) 1) (ite (<= x 0) 1 2)) 2) 1) x) x) 1) x) 1))))
(assert (forall ((x Int)) (= (fast x) (- (- (* (+ (- (+ (* (+ (div (- (* (* x x) x) x) (+ 1 2)) (* x x)) 2) (ite (<= x 0) 1 2)) x) 1) (ite (<= x 0) 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
