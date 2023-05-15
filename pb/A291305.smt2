;; sequence(s): A291305
;; terms: 1 2 3 0 5 6 7 8 5 10 11 12 13 10 15 16 17 18 15 20
;; small program: (1 - (if ((2 + x) mod (1 + (2 + 2))) <= 0 then (2 + 2) else 0)) + x
;; fast program: (loop(0 - x, (x mod (1 + (2 + 2))) - 2, 2) - 1) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- 1 (ite (<= (mod (+ 2 x) (+ 1 (+ 2 2))) 0) (+ 2 2) 0)) x))))
(assert (forall ((x Int)) (= (f0 x) (- 0 x))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 1 (+ 2 2))) 2))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (- (v0 x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
