;; sequence(s): A25734
;; terms: 1 5 12 22 35 51 71 94 120 149 181 216 255 297 342 390 441 495 553 614
;; small program: loop((((((y div 2) div (1 + 2)) + x) + y) + y) + y, x, 1) + x
;; fast program: ((((1 + (2 + (2 * (2 * (2 + 2))))) * (((2 + x) * x) + 1)) - 1) div (((2 + 2) + 2) * 2)) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (+ (div (div y 2) (+ 1 2)) x) y) y) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (- (div (- (* (+ 1 (+ 2 (* 2 (* 2 (+ 2 2))))) (+ (* (+ 2 x) x) 1)) 1) (* (+ (+ 2 2) 2) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
