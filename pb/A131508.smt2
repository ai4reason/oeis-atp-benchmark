;; sequence(s): A131508
;; terms: 0 0 0 2 1 1 1 4 2 2 2 6 3 3 3 8 4 4 4 10
;; small program: (1 + x) div ((2 - (((x div 2) * x) mod 2)) * 2)
;; fast program: loop(2 + (x + x), (x mod (2 + 2)) - 2, x) div (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ 1 x) (* (- 2 (mod (* (div x 2) x) 2)) 2)))))
(assert (forall ((x Int)) (= (f0 x) (+ 2 (+ x x)))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (v0 x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
