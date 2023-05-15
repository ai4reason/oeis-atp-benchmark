;; sequence(s): A71980
;; terms: 0 1 2 3 4 5 6 7 8 9 11 13 15 17 19 21 23 25 27 29
;; small program: ((((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2))))) mod (if x <= 0 then 1 else x)) + x
;; fast program: ((((0 - (x div (2 + (2 * (2 + 2))))) * ((2 * (2 + 2)) + 1)) + x) mod (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (mod (+ (div (div x 2) (+ 1 (+ 2 2))) (mod x (+ 2 (* 2 (+ 2 2))))) (ite (<= x 0) 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (mod (+ (* (- 0 (div x (+ 2 (* 2 (+ 2 2))))) (+ (* 2 (+ 2 2)) 1)) x) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
