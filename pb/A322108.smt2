;; sequence(s): A322108
;; terms: 1 3 7 15 29 50 79 118 169 233 311 405 517 648 799 972 1169 1391 1639 1915
;; small program: loop(1 + (((y * y) - (x div y)) + x), x, 0) + 1
;; fast program: 1 + (((1 + ((2 + x) * (x * x))) div (2 + 2)) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ (- (* y y) (div x y)) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (div (+ 1 (* (+ 2 x) (* x x))) (+ 2 2)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)