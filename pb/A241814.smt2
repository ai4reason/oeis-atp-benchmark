;; sequence(s): A241814
;; terms: 1 1 1 2 2 4 2 5 4 7
;; small program: (((1 + 2) * ((x div 2) div (2 - (x mod 2)))) div 2) + 1
;; fast program: (((1 + 2) * (x div (2 * (2 - (x mod 2))))) div 2) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (* (+ 1 2) (div (div x 2) (- 2 (mod x 2)))) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* (+ 1 2) (div x (* 2 (- 2 (mod x 2))))) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
