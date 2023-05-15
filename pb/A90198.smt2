;; sequence(s): A90198
;; terms: 1 42 197 562 1257 2426 4237 6882 10577 15562 22101 30482 41017 54042 69917 89026 111777 138602 169957 206322
;; small program: ((((1 + (2 * loop(1 + (x + y), 2 + x, x))) * (1 + x)) * x) + 1) - x
;; fast program: ((((((1 + ((1 + x) * (((2 + 2) * 2) + x))) * (x + 1)) + x) + x) * x) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (+ (* (* (+ 1 (* 2 (v0 x))) (+ 1 x)) x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (+ (* (+ 1 (* (+ 1 x) (+ (* (+ 2 2) 2) x))) (+ x 1)) x) x) x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
