;; sequence(s): A98660
;; terms: 1 1 4 6 24 40 160 280 1120 2016 8064 14784 59136 109824 439296 823680 3294720 6223360 24893440 47297536
;; small program: loop((2 - (y mod 2)) * ((x * y) div (y - (y div 2))), x, 1)
;; fast program: loop(2 * (2 * (((x div y) + x) + x)), x div 2, 1 + (x mod 2)) div (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (- 2 (mod y 2)) (div (* x y) (- y (div y 2)))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (* 2 (+ (+ (div x y) x) x))))))
(assert (forall ((x Int)) (= (g1 x) (div x 2))))
(assert (forall ((x Int)) (= (h1 x) (+ 1 (mod x 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (v1 x) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)