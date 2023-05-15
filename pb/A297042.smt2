;; sequence(s): A297042
;; terms: 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1
;; small program: x div loop(2 + (x + y), 2, x div 2)
;; fast program: if (x - (2 * (2 + (2 + 2)))) <= 0 then 0 else 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ x y)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div x (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- x (* 2 (+ 2 (+ 2 2)))) 0) 0 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)