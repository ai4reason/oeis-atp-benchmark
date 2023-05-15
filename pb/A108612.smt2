;; sequence(s): A108612
;; terms: 1 4 9 16 25 42 56 72 90 110 143 168 195 224 255 304 340 378 418 460
;; small program: (1 + (((x - ((x div 2) div 2)) div (2 + 2)) + x)) * (1 + x)
;; fast program: (1 + (((x - (x div (2 + 2))) div (2 + 2)) + x)) * (1 + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 (+ (div (- x (div (div x 2) 2)) (+ 2 2)) x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ (div (- x (div x (+ 2 2))) (+ 2 2)) x)) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
