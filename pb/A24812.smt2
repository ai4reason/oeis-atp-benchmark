;; sequence(s): A24812
;; terms: 2 4 7 9 11 14 16 18 21 23 25 28 30 32 34 37 39 41 44 46
;; small program: (((((if (((x div 2) div 2) - 2) <= 0 then 1 else 0) + x) div (1 + 2)) + 2) + x) + x
;; fast program: (((((if ((2 * (2 + (2 + 2))) - x) <= 0 then 0 else 1) + x) div (1 + 2)) + x) + 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (+ (ite (<= (- (div (div x 2) 2) 2) 0) 1 0) x) (+ 1 2)) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (ite (<= (- (* 2 (+ 2 (+ 2 2))) x) 0) 0 1) x) (+ 1 2)) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
