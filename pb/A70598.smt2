;; sequence(s): A70598
;; terms: 0 1 6 9 10 5 2 11 8 3 4 7 12 0 1 6 9 10 5 2
;; small program: (loop(x * x, 2, x) * x) mod (1 + (2 * (2 + (2 + 2))))
;; fast program: ((((x * x) * x) * x) * x) mod (1 + (2 * (2 + (2 + 2))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (mod (* (v0 x) x) (+ 1 (* 2 (+ 2 (+ 2 2))))))))
(assert (forall ((x Int)) (= (fast x) (mod (* (* (* (* x x) x) x) x) (+ 1 (* 2 (+ 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
