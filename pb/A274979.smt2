;; sequence(s): A274979
;; terms: 0 1 15 18 46 51 93 100 156 165 235 246 330 343 441 456 568 585 711 730
;; small program: ((1 + (2 * (2 + ((x - (x mod 2)) + x)))) * (x div 2)) + x
;; fast program: ((((1 + (x + x)) * ((1 + 2) * (x div 2))) - (x * x)) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 (* 2 (+ 2 (+ (- x (mod x 2)) x)))) (div x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (* (+ 1 (+ x x)) (* (+ 1 2) (div x 2))) (* x x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
