;; sequence(s): A71282
;; terms: 2 3 1 3 2 3 2 3 1 3 2 3 2 3 1 3 2 3 2 3
;; small program: ((if (x mod 2) <= 0 then (1 - (x mod (1 + 2))) else 2) div 2) + 2
;; fast program: loop(1 + 2, x mod 2, if ((1 + x) mod (1 + 2)) <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (ite (<= (mod x 2) 0) (- 1 (mod x (+ 1 2))) 2) 2) 2))))
(assert (= f0 (+ 1 2)))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) (ite (<= (mod (+ 1 x) (+ 1 2)) 0) 1 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
