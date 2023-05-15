;; sequence(s): A194223
;; terms: 0 0 1 1 2 2 2 3 3 4 5 5 5 5 6 6 7 7 7 8
;; small program: ((((2 + x) div (1 + 2)) + ((x div (1 + 2)) mod 2)) + (x div 2)) div 2
;; fast program: (((if ((2 + x) mod (2 + (2 + 2))) <= 0 then 1 else 0) - (x div (2 + (2 + 2)))) + x) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (+ (div (+ 2 x) (+ 1 2)) (mod (div x (+ 1 2)) 2)) (div x 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ (- (ite (<= (mod (+ 2 x) (+ 2 (+ 2 2))) 0) 1 0) (div x (+ 2 (+ 2 2)))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
