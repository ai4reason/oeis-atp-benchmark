;; sequence(s): A22849
;; terms: 0 2 5 7 10 12 15 17 20 22 24 27 29 32 34 37 39 42 44 47
;; small program: (((x - ((x div 2) div (1 + (2 + 2)))) div 2) + x) + x
;; fast program: (((x - (x div (2 + (2 * (2 + 2))))) div 2) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (- x (div (div x 2) (+ 1 (+ 2 2)))) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- x (div x (+ 2 (* 2 (+ 2 2))))) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
