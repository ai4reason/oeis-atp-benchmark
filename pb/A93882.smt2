;; sequence(s): A93882-A138953
;; terms: 0 0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7 8 9 10
;; small program: (((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2))))) mod (if x <= 0 then 1 else x)
;; fast program: (x - ((1 + (2 * (2 + 2))) * (x div (2 + (2 * (2 + 2)))))) mod (if x <= 0 then 1 else x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (+ (div (div x 2) (+ 1 (+ 2 2))) (mod x (+ 2 (* 2 (+ 2 2))))) (ite (<= x 0) 1 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (- x (* (+ 1 (* 2 (+ 2 2))) (div x (+ 2 (* 2 (+ 2 2)))))) (ite (<= x 0) 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
