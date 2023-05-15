;; sequence(s): A130151
;; terms: 1 1 1 ~1 ~1 ~1 1 1 1 ~1 ~1 ~1 1 1 1 ~1 ~1 ~1 1 1
;; small program: loop(0 - x, x div (1 + 2), 1)
;; fast program: 1 - (if ((x mod (2 + (2 + 2))) - 2) <= 0 then 0 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 0 x))))
(assert (forall ((x Int)) (= (g0 x) (div x (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (- 1 (ite (<= (- (mod x (+ 2 (+ 2 2))) 2) 0) 0 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)