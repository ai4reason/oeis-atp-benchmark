;; sequence(s): A24813
;; terms: 4 7 12 15 18 23 26 29 34 37 40 45 48 51 54 59 62 65 70 73
;; small program: ((((((if ((x div (2 + 2)) - 2) <= 0 then 1 else 0) + x) div (1 + 2)) + 2) + x) * 2) + x
;; fast program: ((((((if (x - (2 * (2 + (2 + 2)))) <= 0 then 1 else 0) + x) div (1 + 2)) + 2) + x) * 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ (+ (div (+ (ite (<= (- (div x (+ 2 2)) 2) 0) 1 0) x) (+ 1 2)) 2) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (+ (div (+ (ite (<= (- x (* 2 (+ 2 (+ 2 2)))) 0) 1 0) x) (+ 1 2)) 2) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
