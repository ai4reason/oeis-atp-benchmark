;; sequence(s): A315523
;; terms: 1 6 11 17 22 28 33 39 44 50 56 61 67 72 78 83 89 94 100 106
;; small program: (loop(((0 - ((x div 2) div 2)) div 2) + y, 2 * (x + x), 1) + x) + x
;; fast program: (((1 + ((x div (1 + (2 * (2 + 2)))) + x)) div (if x <= 0 then 1 else 2)) + (2 * (x + x))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (- 0 (div (div x 2) 2)) 2) y))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ x x)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ 1 (+ (div x (+ 1 (* 2 (+ 2 2)))) x)) (ite (<= x 0) 1 2)) (* 2 (+ x x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
