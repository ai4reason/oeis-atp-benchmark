;; sequence(s): A315537
;; terms: 1 6 11 17 23 28 34 39 45 51 56 62 68 73 79 85 90 96 101 107
;; small program: ((loop(y - ((x div 2) div (1 + (2 + 2))), 2 * (2 * (x + x)), 2) div 2) + x) + x
;; fast program: (((((((x + x) + x) div (1 + (2 + (2 * (2 + 2))))) + 1) + x) div (if x <= 0 then 1 else 2)) + ((x + x) * 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (div x 2) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (* 2 (+ x x))))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (v0 x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (div (+ (+ x x) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) x) (ite (<= x 0) 1 2)) (* (+ x x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
