;; sequence(s): A109451
;; terms: 1 3 2 5 4 6 7 8 9 11 10 13 12 14 15 16 17 19 18 21
;; small program: 1 + (((x mod 2) - ((((x div 2) + x) div 2) mod 2)) + x)
;; fast program: (((((x - 1) div (2 + 2)) + x) mod 2) + (x mod 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (- (mod x 2) (mod (div (+ (div x 2) x) 2) 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (mod (+ (div (- x 1) (+ 2 2)) x) 2) (mod x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
