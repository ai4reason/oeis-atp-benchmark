;; sequence(s): A106612-A337864
;; terms: 0 1 2 3 4 5 6 7 8 9 10 1 12 13 14 15 16 17 18 19
;; small program: x div (if (x mod loop(1 + (x + x), 2, 2)) <= 0 then (2 + (2 * (2 + 2))) else 1)
;; fast program: loop(x div (2 + (2 * (2 + 2))), if (x mod (1 + (2 + (2 * (2 + 2))))) <= 0 then 1 else 0, x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (div x (ite (<= (mod x v0) 0) (+ 2 (* 2 (+ 2 2))) 1)))))
(assert (forall ((x Int)) (= (f1 x) (div x (+ 2 (* 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (g1 x) (ite (<= (mod x (+ 1 (+ 2 (* 2 (+ 2 2))))) 0) 1 0))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
