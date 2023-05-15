;; sequence(s): A260260
;; terms: 0 1 29 132 358 755 1371 2254 3452 5013 6985 9416 12354 15847 19943 24690 30136 36329 43317 51148
;; small program: ((((x * x) - x) div 2) * loop(1 - (x + x), 2 + 2, x)) + x
;; fast program: (((((2 * ((2 * (2 * (x + x))) - 2)) * x) - x) * (x - 1)) div 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 1 (+ x x)))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (div (- (* x x) x) 2) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* (- (* (* 2 (- (* 2 (* 2 (+ x x))) 2)) x) x) (- x 1)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
