;; sequence(s): A180316
;; terms: 0 11 23 36 40 55 61 78 86 95 105 116 128 131 145 150 166 173 181 190
;; small program: (((((x * x) + x) div 2) mod (2 + (2 * (2 + 2)))) + x) + loop((x * 2) + x, 2, x)
;; fast program: ((((((x * x) + x) div 2) mod (2 + (2 * (2 + 2)))) + x) + (((2 + 2) * x) * 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* x 2) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (mod (div (+ (* x x) x) 2) (+ 2 (* 2 (+ 2 2)))) x) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (mod (div (+ (* x x) x) 2) (+ 2 (* 2 (+ 2 2)))) x) (* (* (+ 2 2) x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
