;; sequence(s): A57358
;; terms: 0 0 1 1 2 2 3 4 4 5 5 6 6 7 8 8 9 9 10 10
;; small program: ((x div (1 + (2 + (2 + 2)))) + x) div 2
;; fast program: (2 * (x + x)) div (1 + (2 + (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (div x (+ 1 (+ 2 (+ 2 2)))) x) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* 2 (+ x x)) (+ 1 (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
