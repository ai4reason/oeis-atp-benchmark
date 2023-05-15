;; sequence(s): A231072
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; small program: if ((x div loop(2 * (2 + x), 2, 2)) * (x mod (2 + (2 * (2 + 2))))) <= 0 then 1 else 2
;; fast program: if (((x div (2 + (2 * (2 + 2)))) - 1) * (x mod (2 + (2 * (2 + 2))))) <= 0 then 1 else 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (ite (<= (* (div x v0) (mod x (+ 2 (* 2 (+ 2 2))))) 0) 1 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (* (- (div x (+ 2 (* 2 (+ 2 2)))) 1) (mod x (+ 2 (* 2 (+ 2 2))))) 0) 1 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
