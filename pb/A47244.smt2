;; sequence(s): A47244
;; terms: 0 2 3 6 8 9 12 14 15 18 20 21 24 26 27 30 32 33 36 38
;; small program: (x - ((x mod (1 + 2)) div 2)) + x
;; fast program: loop(x - 1, (x mod (1 + 2)) - 1, x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- x (div (mod x (+ 1 2)) 2)) x))))
(assert (forall ((x Int)) (= (f0 x) (- x 1))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
