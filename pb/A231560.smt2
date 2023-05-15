;; sequence(s): A231560
;; terms: 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; small program: loop(((1 + y) div ((x * x) * x)) + x, x, 1) div 2
;; fast program: if ((x - 1) - (2 * (2 * (2 + (2 + 2))))) <= 0 then (if x <= 0 then 0 else 1) else 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ 1 y) (* (* x x) x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (- x 1) (* 2 (* 2 (+ 2 (+ 2 2))))) 0) (ite (<= x 0) 0 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
