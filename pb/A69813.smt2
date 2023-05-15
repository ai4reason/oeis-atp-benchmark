;; sequence(s): A69813
;; terms: 1 2 3 6 7 10 13 16 19 24 27 32 37 42 47 54 59 66 73 80
;; small program: 1 + (((((x * x) div (1 + 2)) + (x mod 2)) div 2) + x)
;; fast program: 1 + ((2 * ((2 + (2 + (x * x))) div (2 * (2 + (2 + 2))))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (div (+ (div (* x x) (+ 1 2)) (mod x 2)) 2) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* 2 (div (+ 2 (+ 2 (* x x))) (* 2 (+ 2 (+ 2 2))))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
