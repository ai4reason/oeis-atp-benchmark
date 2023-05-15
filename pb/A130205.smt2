;; sequence(s): A130205
;; terms: 1 2 6 8 11 17 21 26 34 40 47 57 65 74 86 96 107 121 133 146
;; small program: (1 + ((((x * x) + x) div (1 + 2)) + x)) + ((x mod (1 + 2)) div 2)
;; fast program: ((((2 + x) * (2 + x)) div (1 + 2)) - ((x - 2) mod (1 + 2))) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (+ (div (+ (* x x) x) (+ 1 2)) x)) (div (mod x (+ 1 2)) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (- (div (* (+ 2 x) (+ 2 x)) (+ 1 2)) (mod (- x 2) (+ 1 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
