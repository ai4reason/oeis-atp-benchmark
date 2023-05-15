;; sequence(s): A169869
;; terms: 5 6 7 8 9 10 10 11 12 13 14
;; small program: 2 + (2 + (loop(0, (x div 2) - 2, 1) + x))
;; fast program: (1 + 2) + ((if (((x - 2) - 2) - 1) <= 0 then 2 else 1) + x)
(set-logic UFNIA)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- (div x 2) 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 2 (+ 2 (+ (v0 x) x))))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 2) (+ (ite (<= (- (- (- x 2) 2) 1) 0) 2 1) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)