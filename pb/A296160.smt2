;; sequence(s): A296160
;; terms: 0 0 0 2 3 4 5 10 12 14 16 24 27 30 33 44 48 52 56 70
;; small program: ((1 + ((x div 2) + x)) div 2) * ((1 + x) div (2 + 2))
;; fast program: ((1 + x) div (2 + 2)) * (x - ((1 + x) div (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div (+ 1 (+ (div x 2) x)) 2) (div (+ 1 x) (+ 2 2))))))
(assert (forall ((x Int)) (= (fast x) (* (div (+ 1 x) (+ 2 2)) (- x (div (+ 1 x) (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
