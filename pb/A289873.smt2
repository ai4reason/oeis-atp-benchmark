;; sequence(s): A289873
;; terms: 1 3 5 7 9 15 21 27 33 39 45 55 65 75 85 95 105 119 133 147
;; small program: (((((((x - 1) div 2) * (x div 2)) div (1 + 2)) * 2) + x) * 2) + 1
;; fast program: (((((1 + ((x - 2) * x)) div (((2 + 2) + 2) * 2)) * 2) + x) * 2) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ (* (div (* (div (- x 1) 2) (div x 2)) (+ 1 2)) 2) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (* (div (+ 1 (* (- x 2) x)) (* (+ (+ 2 2) 2) 2)) 2) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
