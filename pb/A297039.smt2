;; sequence(s): A297039
;; terms: 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1
;; small program: if (((x div 2) - 2) - 2) <= 0 then 0 else 1
;; fast program: loop(0, 2 + ((2 * (2 + 2)) - x), 1)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (- (- (div x 2) 2) 2) 0) 0 1))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (- (* 2 (+ 2 2)) x)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
