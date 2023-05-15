;; sequence(s): A162258
;; terms: ~1 9 36 86 165 279 434 636 891 1205 1584 2034 2561 3171 3870 4664 5559 6561 7676 8910
;; small program: (((1 + (x + x)) * (loop(x + y, x, x) + x)) - 1) + x
;; fast program: (((((2 + (2 + x)) * (x + x)) - 2) + x) * (1 + x)) div 2
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
(assert (forall ((x Int)) (= (small x) (+ (- (* (+ 1 (+ x x)) (+ (v0 x) x)) 1) x))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (- (* (+ 2 (+ 2 x)) (+ x x)) 2) x) (+ 1 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
