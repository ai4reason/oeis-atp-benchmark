;; sequence(s): A63281
;; terms: ~1 0 1 3 3 5 5 8 7 10 9 13 11 15 13 18 15 20 17 23
;; small program: ((((x div 2) * (x mod 2)) - 1) div 2) + x
;; fast program: loop(((1 + x) div (2 + 2)) + x, x mod 2, x) - 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (- (* (div x 2) (mod x 2)) 1) 2) x))))
(assert (forall ((x Int)) (= (f0 x) (+ (div (+ 1 x) (+ 2 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (v0 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
