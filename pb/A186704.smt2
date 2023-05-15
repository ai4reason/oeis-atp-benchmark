;; sequence(s): A186704
;; terms: 0 1 1 2 2 3 3 4 4 5 5 5 6
;; small program: ((if (((x div 2) - 2) - 2) <= 0 then 1 else 0) + x) div 2
;; fast program: (loop(0, (x - 2) - (2 * (2 + 2)), 1) + x) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (ite (<= (- (- (div x 2) 2) 2) 0) 1 0) x) 2))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- (- x 2) (* 2 (+ 2 2))))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (div (+ (v0 x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
