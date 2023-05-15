;; sequence(s): A310341
;; terms: 1 4 10 12 18 20 26 30 34 40 42 48 50 56 60 64 70 72 78 80
;; small program: (((((((((((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + (2 + 2)))) + x) + x) + (x div (1 + (2 + (2 + 2))))) * (1 + 2)) div 2) div 2) + 1) + x) * 2) + 1) + x) div (1 + 2)) * (if x <= 0 then 1 else 2)
;; fast program: ((((((((((((((((((1 + (2 + (x + x))) div (1 + (2 + (2 + 2)))) + x) + x) * 2) + (if x <= 0 then 1 else x)) + x) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) + x) div (1 + 2)) - x) - x) * (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div (+ (+ (* (+ (+ (div (div (* (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (+ 2 2)))) x) x) (div x (+ 1 (+ 2 (+ 2 2))))) (+ 1 2)) 2) 2) 1) x) 2) 1) x) (+ 1 2)) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (* (- (- (div (+ (+ (* (+ (div (+ (+ (* (+ (+ (* (+ (+ (div (+ 1 (+ 2 (+ x x))) (+ 1 (+ 2 (+ 2 2)))) x) x) 2) (ite (<= x 0) 1 x)) x) 2) 1) x) (+ 1 2)) x) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
