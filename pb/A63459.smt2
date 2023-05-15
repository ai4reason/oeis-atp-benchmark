;; sequence(s): A63459
;; terms: 0 2 4 6 8 10 12 14 17 19 21 23 25 27 29 32 34 36 38 40
;; small program: (loop((x + y) div (2 * (2 + 2)), x, 0) + x) + x
;; fast program: ((((if x <= 0 then 1 else x) - 1) div (1 + (2 + (2 + 2)))) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ x y) (* 2 (+ 2 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (+ 2 2)))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
