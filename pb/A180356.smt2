;; sequence(s): A180356
;; terms: 0 7 76 747 4120 15655 46692 117691 262192 531495 1000060 1771627 2986056 4826887 7529620 11390715 16777312 24137671 34012332 47045995
;; small program: (2 + (2 + (2 + (loop(x * x, 2, x) * x)))) * x
;; fast program: (2 + (2 + (2 + ((((x * x) * x) * x) * x)))) * x
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
(assert (forall ((x Int)) (= (small x) (* (+ 2 (+ 2 (+ 2 (* (v0 x) x)))) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 2 (+ 2 (+ 2 (* (* (* (* x x) x) x) x)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
