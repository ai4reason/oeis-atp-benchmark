;; sequence(s): A257849
;; terms: 0 0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7 8 0 2
;; small program: (x mod (1 + (2 * (2 + 2)))) * loop(x div (1 + 2), 2, x)
;; fast program: (x div (1 + (2 * (2 + 2)))) * (x mod (1 + (2 * (2 + 2))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (mod x (+ 1 (* 2 (+ 2 2)))) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (div x (+ 1 (* 2 (+ 2 2)))) (mod x (+ 1 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)