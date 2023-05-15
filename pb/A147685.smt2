;; sequence(s): A147685
;; terms: 0 1 1 5 4 13 9 25 16 41 25 61 36 85 49 113 64 145 81 181
;; small program: (1 + ((x div (2 - (x mod 2))) * x)) div 2
;; fast program: (1 + (x * x)) div (2 * (2 - (x mod 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ 1 (* (div x (- 2 (mod x 2))) x)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ 1 (* x x)) (* 2 (- 2 (mod x 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
