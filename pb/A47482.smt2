;; sequence(s): A47482
;; terms: 1 2 5 7 9 10 13 15 17 18 21 23 25 26 29 31 33 34 37 39
;; small program: ((loop(y, x mod (2 + 2), 2) div 2) + x) + x
;; fast program: ((if ((1 - x) mod (2 + 2)) <= 0 then 0 else 1) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 2 2)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (v0 x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (ite (<= (mod (- 1 x) (+ 2 2)) 0) 0 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
