;; sequence(s): A187191
;; terms: 0 8 288 2208 9200 27720 68208 146048 282528 505800 851840 1365408 2101008 3123848 4510800 6351360 8748608 11820168 15699168 20535200
;; small program: ((1 + (2 * (((x * x) * x) - x))) * (loop(1 + (x + x), 2, x) * x)) + x
;; fast program: (((1 + (2 * (((x * x) * x) - x))) * (1 + (2 + (2 * (x + x))))) * x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 (* 2 (- (* (* x x) x) x))) (* (v0 x) x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (* (+ 1 (* 2 (- (* (* x x) x) x))) (+ 1 (+ 2 (* 2 (+ x x))))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
