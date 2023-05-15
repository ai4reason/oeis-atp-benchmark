;; sequence(s): A187012
;; terms: 1 2 5 4 8 6 11 8 14 10 17 12 20 14 23 16 26 18 29 20
;; small program: 1 + ((((x * x) div 2) mod (1 + x)) + x)
;; fast program: loop((x * x) mod (1 + (x + x)), 1 - (x mod 2), x) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (mod (div (* x x) 2) (+ 1 x)) x)))))
(assert (forall ((x Int)) (= (f0 x) (mod (* x x) (+ 1 (+ x x))))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
