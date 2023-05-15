;; sequence(s): A82010
;; terms: 0 2 1 5 2 9 3 12 4 15 5 18 6 21 7 25 8 28 9 31
;; small program: (((2 + (((x div (1 + (2 + 2))) + x) + x)) * (x mod 2)) + x) div 2
;; fast program: loop(2 + ((((x div (1 + (2 + 2))) + x) + x) + x), x mod 2, x) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (* (+ 2 (+ (+ (div x (+ 1 (+ 2 2))) x) x)) (mod x 2)) x) 2))))
(assert (forall ((x Int)) (= (f0 x) (+ 2 (+ (+ (+ (div x (+ 1 (+ 2 2))) x) x) x)))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
