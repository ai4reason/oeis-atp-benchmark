;; sequence(s): A247971
;; terms: 1 2 3 4 5 5 6 7 8 8 9 10 11 12 12 13 14 15 16 16
;; small program: (1 - (((x - (x div 2)) + x) div (1 + (2 + (2 + 2))))) + x
;; fast program: 1 + (x - ((1 + ((x + x) + x)) div ((((2 + 2) + 2) * 2) + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- 1 (div (+ (- x (div x 2)) x) (+ 1 (+ 2 (+ 2 2))))) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (- x (div (+ 1 (+ (+ x x) x)) (+ (* (+ (+ 2 2) 2) 2) 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
