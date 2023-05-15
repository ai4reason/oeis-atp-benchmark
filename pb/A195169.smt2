;; sequence(s): A195169
;; terms: 0 2 4 6 8 10 12 14 16 18 20 22 24 25 27 29 31 33 35 37
;; small program: (x + x) - (((x div (1 + 2)) + x) div (1 + (2 * (2 * (2 + 2)))))
;; fast program: (x - ((2 * (x + x)) div ((1 + (2 * (2 * (2 + 2)))) * (1 + 2)))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (+ x x) (div (+ (div x (+ 1 2)) x) (+ 1 (* 2 (* 2 (+ 2 2)))))))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (div (* 2 (+ x x)) (* (+ 1 (* 2 (* 2 (+ 2 2)))) (+ 1 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
