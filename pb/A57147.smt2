;; sequence(s): A57147
;; terms: 0 1 4 9 16 25 36 49 64 81 10 22 36 52 70 90 112 136 162 190
;; small program: (((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2))))) * x
;; fast program: (x - ((1 + (2 * (2 + 2))) * (x div (2 + (2 * (2 + 2)))))) * x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ (div (div x 2) (+ 1 (+ 2 2))) (mod x (+ 2 (* 2 (+ 2 2))))) x))))
(assert (forall ((x Int)) (= (fast x) (* (- x (* (+ 1 (* 2 (+ 2 2))) (div x (+ 2 (* 2 (+ 2 2)))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
