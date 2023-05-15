;; sequence(s): A47229
;; terms: 0 2 3 4 6 8 9 10 12 14 15 16 18 20 21 22 24 26 27 28
;; small program: x - ((((x div 2) mod 2) - x) div 2)
;; fast program: loop((x mod 2) + x, x mod 2, (x div 2) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- x (div (- (mod (div x 2) 2) x) 2)))))
(assert (forall ((x Int)) (= (f0 x) (+ (mod x 2) x))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) (+ (div x 2) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
