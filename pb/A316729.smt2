;; sequence(s): A316729
;; terms: 0 1 27 30 82 87 165 172 276 285 415 426 582 595 777 792 1000 1017 1251 1270
;; small program: loop((((if (y mod 2) <= 0 then (2 * (2 + (2 + 2))) else 0) * y) + x) + y, x, 0)
;; fast program: (((((((1 + (2 + 2)) * (x div 2)) + x) * (1 + (x div 2))) * 2) * 2) - x) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* (ite (<= (mod y 2) 0) (* 2 (+ 2 (+ 2 2))) 0) y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (div (- (* (* (* (+ (* (+ 1 (+ 2 2)) (div x 2)) x) (+ 1 (div x 2))) 2) 2) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)