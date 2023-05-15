;; sequence(s): A95721
;; terms: 1 2 3 5 4 7 6 10 8 13 9 15 11 18 12 20 14 23 16 26
;; small program: (((((((((((x div 2) div 2) + (x mod 2)) + x) div 2) + x) + 1) + x) - x) + 1) + (if (x mod 2) <= 0 then 1 else x)) div 2
;; fast program: ((((((((((if (x mod 2) <= 0 then 1 else (x + x)) + x) + (x div (2 + 2))) + 2) - x) + 1) + x) div 2) + 1) + x) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (+ (- (+ (+ (+ (div (+ (+ (div (div x 2) 2) (mod x 2)) x) 2) x) 1) x) x) 1) (ite (<= (mod x 2) 0) 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ (+ (div (+ (+ (- (+ (+ (+ (ite (<= (mod x 2) 0) 1 (+ x x)) x) (div x (+ 2 2))) 2) x) 1) x) 2) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
