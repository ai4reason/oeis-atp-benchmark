;; sequence(s): A256079
;; terms: 1 2 3 4 5 6 7 8 9 10 21 22 23 24 25 26 27 28 29 30
;; small program: (1 + loop((2 + (2 * (2 + 2))) mod (1 + x), x, x)) + x
;; fast program: (((if (2 + ((2 * (2 + 2)) - x)) <= 0 then (1 + (2 + 2)) else 0) * 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (mod (+ 2 (* 2 (+ 2 2))) (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (ite (<= (+ 2 (- (* 2 (+ 2 2)) x)) 0) (+ 1 (+ 2 2)) 0) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
