;; sequence(s): A57367
;; terms: 0 0 0 1 1 1 2 2 2 3 3 4 4 4 5 5 5 6 6 6
;; small program: (((x div 2) div (1 + (2 + 2))) + x) div (1 + 2)
;; fast program: ((x div (2 + (2 * (2 + 2)))) + x) div (1 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (div (div x 2) (+ 1 (+ 2 2))) x) (+ 1 2)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (div x (+ 2 (* 2 (+ 2 2)))) x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
