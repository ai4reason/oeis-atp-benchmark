;; sequence(s): A112652
;; terms: 0 1 4 9 12 13 16 21 24 25 28 33 36 37 40 45 48 49 52 57
;; small program: (2 * loop(y - (x mod 2), x, x)) + x
;; fast program: ((x - (((x * x) + x) mod (2 + 2))) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (mod x 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- x (mod (+ (* x x) x) (+ 2 2))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
