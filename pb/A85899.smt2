;; sequence(s): A85899
;; terms: 4 9 16 23 30 38 46 53 61 69 77 85 93 101 109 117 124 132 140 148
;; small program: (loop(x + y, 2 + (2 * (x + x)), 2) div (2 + x)) + 2
;; fast program: (((1 + (2 * (2 * (2 * ((x * x) + x))))) div (2 + x)) + 2) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (* 2 (+ x x))))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) (+ 2 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ 1 (* 2 (* 2 (* 2 (+ (* x x) x))))) (+ 2 x)) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
