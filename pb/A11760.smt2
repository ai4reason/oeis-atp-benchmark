;; sequence(s): A11760
;; terms: 1 2 3 4 5 6 7 8 9 10 11 12 14 15 16 17 18 19 20 21
;; small program: (if (((x div 2) div 2) - 2) <= 0 then 1 else 2) + x
;; fast program: (if ((2 * (2 + (2 + 2))) - x) <= 0 then 2 else 1) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (- (div (div x 2) 2) 2) 0) 1 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (- (* 2 (+ 2 (+ 2 2))) x) 0) 2 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
