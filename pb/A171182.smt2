;; sequence(s): A171182
;; terms: 0 1 1 1 0 2 0 1 1 1 0 2 0 1 1 1 0 2 0 1
;; small program: ((x mod (1 + 2)) div 2) + (x mod 2)
;; fast program: (((x * x) div 2) + x) mod (1 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (mod x (+ 1 2)) 2) (mod x 2)))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div (* x x) 2) x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
