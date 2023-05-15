;; sequence(s): A162257
;; terms: ~2 7 33 82 160 273 427 628 882 1195 1573 2022 2548 3157 3855 4648 5542 6543 7657 8890
;; small program: ((1 + (x + x)) * (loop(x + y, x, x) + x)) - 2
;; fast program: ((1 + (x + x)) * (((((x * x) + x) div 2) + x) + x)) - 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 (+ x x)) (+ (v0 x) x)) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (+ x x)) (+ (+ (div (+ (* x x) x) 2) x) x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
