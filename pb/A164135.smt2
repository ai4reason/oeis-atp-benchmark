;; sequence(s): A164135
;; terms: 7 40 54 87 101 134 148 181 195 228 242 275 289 322 336 369 383 416 430 463
;; small program: (((2 * (2 * (2 + (2 * ((((x mod 2) + x) + x) + x))))) - 1) + (x mod 2)) - (x div 2)
;; fast program: (((((1 + ((2 * (((x mod 2) + x) + x)) + x)) * (1 + (2 * (2 + 2)))) div 2) + 1) + 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (+ (- (* 2 (* 2 (+ 2 (* 2 (+ (+ (+ (mod x 2) x) x) x))))) 1) (mod x 2)) (div x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (* (+ 1 (+ (* 2 (+ (+ (mod x 2) x) x)) x)) (+ 1 (* 2 (+ 2 2)))) 2) 1) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
