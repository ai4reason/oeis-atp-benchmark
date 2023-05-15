;; sequence(s): A241406
;; terms: 11 50 72 111 133 172 194 233 255 294 316 355 377 416 438 477 499 538 560 599
;; small program: ((((((1 + (2 + 2)) * (1 + ((((x mod 2) + x) + x) + x))) - (x mod 2)) * 2) + 1) - (x div 2)) + x
;; fast program: ((((((((1 + 2) * (1 + ((((x mod 2) + x) + x) + x))) + x) * 2) + 1) * (1 + 2)) + 1) + x) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (+ (* (- (* (+ 1 (+ 2 2)) (+ 1 (+ (+ (+ (mod x 2) x) x) x))) (mod x 2)) 2) 1) (div x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (div (+ (+ (* (+ (* (+ (* (+ 1 2) (+ 1 (+ (+ (+ (mod x 2) x) x) x))) x) 2) 1) (+ 1 2)) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
