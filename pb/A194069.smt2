;; sequence(s): A194069
;; terms: 1 3 7 11 17 25 33 43 55 67 81 97 113 131 151 171 193 217 241 267
;; small program: 1 + (2 * loop((x - (x div y)) + y, x, 0))
;; fast program: 1 + (2 * (x - ((x - (x * x)) div (1 + 2))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x (div x y)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* 2 (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (- x (div (- x (* x x)) (+ 1 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)