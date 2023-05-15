;; sequence(s): A180964
;; terms: 1 4 4 10 13 13 19 22 22 28 31 31 37 40 40 46 49 49 55 58
;; small program: 1 + ((1 + 2) * (x - ((x mod (1 + 2)) div 2)))
;; fast program: ((loop(0 - 2, (x mod (1 + 2)) - 1, 1) + x) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (* (+ 1 2) (- x (div (mod x (+ 1 2)) 2)))))))
(assert (= f0 (- 0 2)))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 1 2)) 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (v0 x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
