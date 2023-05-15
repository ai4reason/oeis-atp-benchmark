;; sequence(s): A184533
;; terms: 2 6 13 24 37 54 73 96 121 150 181 216 253 294 337 384 433 486 541 600
;; small program: loop(2 + ((2 * ((x div 2) + y)) + y), x, 1) + 1
;; fast program: ((1 + ((2 + x) * x)) * (2 + (if x <= 0 then 2 else 1))) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (* 2 (+ (div x 2) y)) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 (* (+ 2 x) x)) (+ 2 (ite (<= x 0) 2 1))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
