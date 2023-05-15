;; sequence(s): A63161
;; terms: 9 30 52 72 94 116 136 158 180 200 222 244 264 286 308 328 350 372 392 414
;; small program: (((loop(2 * (2 + (x + x)), 2, x + x) div (1 + 2)) * 2) - (if x <= 0 then 1 else 2)) - 2
;; fast program: ((((2 * (2 + ((2 * (x + x)) + x))) - (x div (1 + 2))) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 (+ x x))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (- (* (div (v0 x) (+ 1 2)) 2) (ite (<= x 0) 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (- (* 2 (+ 2 (+ (* 2 (+ x x)) x))) (div x (+ 1 2))) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
