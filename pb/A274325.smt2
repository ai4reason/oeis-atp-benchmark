;; sequence(s): A274325
;; terms: 1 1 17 122 513 1563 3889 8404 16385 29525 50001 80526 124417 185647 268913 379688 524289 709929 944785 1238050
;; small program: 1 + ((loop(x * x, 2, x) * x) div 2)
;; fast program: 1 + (((((x * x) * x) * x) * x) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (div (* (v0 x) x) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (div (* (* (* (* x x) x) x) x) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)