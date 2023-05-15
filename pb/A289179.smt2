;; sequence(s): A289179
;; terms: 0 1 4 14 28 55 88 140 200 285 380 506 644 819 1008 1240 1488 1785 2100 2470
;; small program: (x div (2 - (x mod 2))) - loop(x - (y * y), x, x)
;; fast program: ((((x * x) * x) - x) div (1 + 2)) + ((x - (x div 2)) * x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x (* y y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (div x (- 2 (mod x 2))) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (* (* x x) x) x) (+ 1 2)) (* (- x (div x 2)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
