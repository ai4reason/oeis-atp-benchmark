;; sequence(s): A88227
;; terms: 2 6 7 11 15 19 20 24 28 32 33 37 41 45 46 50 54 58 59 63
;; small program: loop((((x + y) div 2) * 2) + (x div 2), 2, x) + x
;; fast program: 2 + (((1 + 2) * (((1 - x) div (2 + 2)) + x)) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (div (+ x y) 2) 2) (div x 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (* (+ 1 2) (+ (div (- 1 x) (+ 2 2)) x)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
