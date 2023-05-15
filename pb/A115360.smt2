;; sequence(s): A115360
;; terms: 1 ~1 1 0 0 0 1 ~1 1 0 0 0 1 ~1 1 0 0 0 1 ~1
;; small program: 1 - (((x mod (1 + 2)) mod 2) + (x mod 2))
;; fast program: 1 - ((((x * x) div 2) - x) mod (1 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- 1 (+ (mod (mod x (+ 1 2)) 2) (mod x 2))))))
(assert (forall ((x Int)) (= (fast x) (- 1 (mod (- (div (* x x) 2) x) (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
