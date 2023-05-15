;; sequence(s): A212714
;; terms: 0 0 2 10 32 78 162 300 512 820 1250 1830 2592 3570 4802 6328 8192 10440 13122 16290
;; small program: ((loop(x * x, 2, x) div 2) div 2) div 2
;; fast program: (((x * x) * x) * x) div (2 * (2 + 2))
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
(assert (forall ((x Int)) (= (small x) (div (div (div (v0 x) 2) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (* (* x x) x) x) (* 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
