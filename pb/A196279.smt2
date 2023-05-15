;; sequence(s): A196279
;; terms: 0 ~2 ~1 0 ~2 ~1 0 ~2 ~1 0 1 ~1 0 1 ~1 0 1 ~1 0 1
;; small program: (((((x + x) div (1 + (2 + 2))) - x) div 2) * (1 + 2)) + x
;; fast program: (((0 - ((x + x) + x)) div (2 + (2 * (2 + 2)))) * (1 + 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (div (- (div (+ x x) (+ 1 (+ 2 2))) x) 2) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (div (- 0 (+ (+ x x) x)) (+ 2 (* 2 (+ 2 2)))) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
