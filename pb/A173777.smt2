;; sequence(s): A173777
;; terms: 2 2 2 2 3 3 4 5 5 6 7 8 9 10 11 12 14 15 16 18
;; small program: ((((((loop((y div (1 + (2 + 2))) + x, x, 1) - (if x <= 0 then 0 else 1)) + x) + 2) - x) + x) div (2 + 1)) + 1
;; fast program: ((((1 + (((((x * x) + x) div (2 + (2 + 2))) + x) + x)) - (if x <= 0 then 1 else 2)) - x) div (1 + (2 + 2))) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y (+ 1 (+ 2 2))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (- (+ (+ (- (v0 x) (ite (<= x 0) 0 1)) x) 2) x) x) (+ 2 1)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (- (+ 1 (+ (+ (div (+ (* x x) x) (+ 2 (+ 2 2))) x) x)) (ite (<= x 0) 1 2)) x) (+ 1 (+ 2 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
