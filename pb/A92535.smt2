;; sequence(s): A92535
;; terms: 1 1 3 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36
;; small program: (1 + (2 * (x * x))) div (1 + x)
;; fast program: loop(y mod 2, (1 + 2) - x, x - 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ 1 (* 2 (* x x))) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (mod y 2))))
(assert (forall ((x Int)) (= (g0 x) (- (+ 1 2) x))))
(assert (forall ((x Int)) (= (h0 x) (- x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
