;; sequence(s): A38502
;; terms: 1 2 1 4 5 2 7 8 1 10 11 4 13 14 5 16 17 2 19 20
;; small program: loop(x div (1 + (if (x mod (1 + 2)) <= 0 then 2 else 0)), x, 1 + x)
;; fast program: loop(if ((1 + x) mod (1 + 2)) <= 0 then (x div (1 + 2)) else x, 2 * (((x * x) - x) mod (1 + 2)), x) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 (ite (<= (mod x (+ 1 2)) 0) 2 0))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (ite (<= (mod (+ 1 x) (+ 1 2)) 0) (div x (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g1 x) (* 2 (mod (- (* x x) x) (+ 1 2))))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v1 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)