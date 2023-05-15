;; sequence(s): A277546
;; terms: 1 2 3 4 5 6 7 1 1 2 3 4 5 6 7 2 1 2 3 4
;; small program: loop(x div loop(1, x mod (2 * (2 + 2)), 2 * (2 + 2)), 2, 1 + x) mod (2 * (2 + 2))
;; fast program: loop(x div loop(1, x mod (2 * (2 + 2)), 2 * (2 + 2)), x mod (2 + 2), 1 + x) mod (2 * (2 + 2))
(set-logic UFNIA)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 () Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (= f1 1))
(assert (forall ((x Int)) (= (g1 x) (mod x (* 2 (+ 2 2))))))
(assert (= h1 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (div x (v1 x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) (* 2 (+ 2 2))))))
(assert (= f3 1))
(assert (forall ((x Int)) (= (g3 x) (mod x (* 2 (+ 2 2))))))
(assert (= h3 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y f3))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (div x (v3 x)))))
(assert (forall ((x Int)) (= (g2 x) (mod x (+ 2 2)))))
(assert (forall ((x Int)) (= (h2 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (v2 x) (* 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)