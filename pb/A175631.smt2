;; sequence(s): A175631
;; terms: 0 2 0 2 5 9 14 20 27 35 44 54 65 77 90 104 119 135 152 170
;; small program: ((1 + x) * ((x + x) mod (2 + x))) div 2
;; fast program: ((loop(1 + ((2 + x) mod (2 + 2)), 2 - x, x) - 2) * (1 + x)) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (* (+ 1 x) (mod (+ x x) (+ 2 x))) 2))))
(assert (forall ((x Int)) (= (f0 x) (+ 1 (mod (+ 2 x) (+ 2 2))))))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (* (- (v0 x) 2) (+ 1 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
