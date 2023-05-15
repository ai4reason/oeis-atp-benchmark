;; sequence(s): A72353
;; terms: 6 11 16 20 25 30 35 39 44 49 54 59 63 68 73 78 83 87 92 97
;; small program: (((((((((((((x + x) div (loop(x * x, 2, 2) - 1)) + x) div 2) + x) + 1) div 2) + 2) + x) + 2) + x) + 2) + x) + x
;; fast program: (((((((((((((x + x) div ((2 * (2 * (2 + 2))) - 1)) + x) div 2) + x) + 1) div 2) + 2) + x) + 2) + x) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (+ (+ (div (+ (+ (div (+ (div (+ x x) (- v0 1)) x) 2) x) 1) 2) 2) x) 2) x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (+ (div (+ (+ (div (+ (div (+ x x) (- (* 2 (* 2 (+ 2 2))) 1)) x) 2) x) 1) 2) 2) x) 2) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
