;; sequence(s): A186324
;; terms: 1 3 5 6 8 9 11 12 14 16 17 19 20 22 23 25 27 28 30 31
;; small program: loop((y div ((((x - 2) + x) + x) * x)) + x, (2 + x) * x, 1) + x
;; fast program: (((((((2 - ((x div (2 + (2 * (2 + (2 + 2))))) + x)) div (2 + 2)) + 2) + x) + x) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y (* (+ (+ (- x 2) x) x) x)) x))))
(assert (forall ((x Int)) (= (g0 x) (* (+ 2 x) x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (+ (div (- 2 (+ (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) x)) (+ 2 2)) 2) x) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
