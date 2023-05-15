;; sequence(s): A209081
;; terms: 1 1 2 2 3 3 4 5 5 6 7 7 8 9 9 10 10 11 12 12
;; small program: loop(y - (((x - ((x div 2) div 2)) + x) div (1 + 2)), x, 1)
;; fast program: ((((2 * (2 * ((1 + 2) * (1 + (x + x))))) - 1) div (1 + (2 + (2 * (2 * (2 + 2)))))) + 1) div (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (+ (- x (div (div x 2) 2)) x) (+ 1 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (div (+ (div (- (* 2 (* 2 (* (+ 1 2) (+ 1 (+ x x))))) 1) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))) 1) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
