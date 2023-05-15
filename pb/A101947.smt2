;; sequence(s): A101947-A337843
;; terms: 1 2 3 4 5 6 7 8 9 10 12 13 14 15 16 17 18 19 20 21
;; small program: (if (((x div 2) - 2) - 2) <= 0 then 1 else 2) + x
;; fast program: loop(1, 2 + ((2 * (2 + 2)) - x), 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (- (- (div x 2) 2) 2) 0) 1 2) x))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (- (* 2 (+ 2 2)) x)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
