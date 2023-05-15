;; sequence(s): A47216
;; terms: 1 2 6 7 11 12 16 17 21 22 26 27 31 32 36 37 41 42 46 47
;; small program: (loop(y - x, x, 1) + x) + x
;; fast program: 1 + (((1 + 2) * (x div 2)) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* (+ 1 2) (div x 2)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)