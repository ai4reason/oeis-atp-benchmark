;; sequence(s): A100531
;; terms: 1 3 7 13 21 23 27 33 41 43 47 53 61 63 67 73 81 83 87 93
;; small program: (2 * loop((y mod (2 + 2)) + x, x - 1, x)) + 1
;; fast program: ((((((if (x mod (2 + 2)) <= 0 then 2 else (0 - 1)) + x) div 2) + x) + x) * 2) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod y (+ 2 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (v0 x)) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (+ (div (+ (ite (<= (mod x (+ 2 2)) 0) 2 (- 0 1)) x) 2) x) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
