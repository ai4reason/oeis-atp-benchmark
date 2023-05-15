;; sequence(s): A33930
;; terms: 1 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 10
;; small program: ((x div 2) div (1 + (2 + 2))) + (if x <= 0 then 1 else (x mod (2 + (2 * (2 + 2)))))
;; fast program: ((0 - (x div (2 + (2 * (2 + 2))))) * ((2 * (2 + 2)) + 1)) + (if x <= 0 then 1 else x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (div x 2) (+ 1 (+ 2 2))) (ite (<= x 0) 1 (mod x (+ 2 (* 2 (+ 2 2)))))))))
(assert (forall ((x Int)) (= (fast x) (+ (* (- 0 (div x (+ 2 (* 2 (+ 2 2))))) (+ (* 2 (+ 2 2)) 1)) (ite (<= x 0) 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
