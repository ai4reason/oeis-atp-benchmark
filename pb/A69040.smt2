;; sequence(s): A69040-A70191
;; terms: 1 5 7 11 13 17 19 23 25 29 31 35 37 41 43 47 49 53 59 61
;; small program: (((((if ((x - 1) - loop(x * x, 2, 2)) <= 0 then 1 else 2) + x) * (1 + 2)) div 2) * 2) - 1
;; fast program: (((((if ((x - 1) - (2 * (2 * (2 + 2)))) <= 0 then 1 else 2) + x) * (1 + 2)) div 2) * 2) - 1
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
(assert (forall ((x Int)) (= (small x) (- (* (div (* (+ (ite (<= (- (- x 1) v0) 0) 1 2) x) (+ 1 2)) 2) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* (div (* (+ (ite (<= (- (- x 1) (* 2 (* 2 (+ 2 2)))) 0) 1 2) x) (+ 1 2)) 2) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
