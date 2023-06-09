;; sequence(s): A82507
;; terms: 2 0 0 0 3 1 1 1 4 2 2 2 5 3 3 3 6 4 4 4
;; small program: ((x div 2) div 2) + (if (x mod (2 + 2)) <= 0 then 2 else 0)
;; fast program: loop(2 + x, 1 - (x mod (2 + 2)), x div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (div x 2) 2) (ite (<= (mod x (+ 2 2)) 0) 2 0)))))
(assert (forall ((x Int)) (= (f0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x (+ 2 2))))))
(assert (forall ((x Int)) (= (h0 x) (div x (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
