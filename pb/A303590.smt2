;; sequence(s): A303590
;; terms: 1 3 6 8 11 13 16 18 20 23 25 28 30 33 35 37 40 42 45 47
;; small program: ((((2 - ((x - (x div (1 + 2))) div (1 + (2 + 2)))) + x) div 2) + x) + x
;; fast program: 1 + ((x + x) + ((x - ((2 + (x + x)) div ((((2 + 2) * 2) * 2) - 1))) div 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (- 2 (div (- x (div x (+ 1 2))) (+ 1 (+ 2 2)))) x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (+ x x) (div (- x (div (+ 2 (+ x x)) (- (* (* (+ 2 2) 2) 2) 1))) 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
