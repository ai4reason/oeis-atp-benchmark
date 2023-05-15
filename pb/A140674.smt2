;; sequence(s): A140674
;; terms: 0 10 23 39 58 80 105 133 164 198 235 275 318 364 413 465 520 578 639 703
;; small program: loop(((1 + 2) * (2 + y)) + x, x, x)
;; fast program: ((1 + 2) * (((((x * x) + x) div 2) + x) + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 1 2) (+ 2 y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (+ (+ (div (+ (* x x) x) 2) x) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
