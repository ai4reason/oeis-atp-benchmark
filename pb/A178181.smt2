;; sequence(s): A178181
;; terms: 0 5 10 16 21 27 32 38 43 49 54
;; small program: ((2 * (x + x)) + (x mod (1 + (x div 2)))) + x
;; fast program: ((2 * (x + x)) + (((if x <= 0 then 2 else x) - 1) div 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (* 2 (+ x x)) (mod x (+ 1 (div x 2)))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* 2 (+ x x)) (div (- (ite (<= x 0) 2 x) 1) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
