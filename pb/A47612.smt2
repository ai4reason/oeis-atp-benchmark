;; sequence(s): A47612
;; terms: 0 2 4 5 8 10 12 13 16 18 20 21 24 26 28 29 32 34 36 37
;; small program: (x - (((x div 2) * x) mod 2)) + x
;; fast program: loop(x - 1, (x mod (2 + 2)) - 2, x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- x (mod (* (div x 2) x) 2)) x))))
(assert (forall ((x Int)) (= (f0 x) (- x 1))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
