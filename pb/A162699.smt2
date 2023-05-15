;; sequence(s): A162699
;; terms: 1 3 5 9 11 13 15 17 19 23 25 27 29 31 33 37 39 41 43 45
;; small program: (loop((2 mod (y div x)) + x, x, 1) + x) + x
;; fast program: 1 + (2 * (x - ((2 - x) div (2 + (2 + 2)))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod 2 (div y x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (- x (div (- 2 x) (+ 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)