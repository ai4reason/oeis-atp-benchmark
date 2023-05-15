;; sequence(s): A57353
;; terms: 0 0 1 2 3 3 4 5 6 6 7 8 9 9 10 11 12 12 13 14
;; small program: ((x div 2) + x) div 2
;; fast program: ((0 - x) div (2 + 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (div x 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- 0 x) (+ 2 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
