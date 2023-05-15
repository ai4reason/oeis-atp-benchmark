;; sequence(s): A243578
;; terms: 39 191 471 879 1415 2079 2871 3791 4839 6015 7319 8751 10311 11999 13815 15759 17831 20031 22359 24815
;; small program: (((2 + loop(x + y, 2 + (2 * (x + x)), x)) * (2 + 2)) * 2) - 1
;; fast program: ((2 + ((1 + x) * (1 + (2 + (2 * (2 * (x + x))))))) * (2 * (2 + 2))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (* 2 (+ x x))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (* (+ 2 (v0 x)) (+ 2 2)) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 2 (* (+ 1 x) (+ 1 (+ 2 (* 2 (* 2 (+ x x))))))) (* 2 (+ 2 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
