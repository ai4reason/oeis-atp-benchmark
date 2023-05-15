;; sequence(s): A282614
;; terms: 0 1 168 5346 67840 496875 2544696 10151428 33693696 97135605 250525000 590412966 1291500288 2653631071 5169160920 9616725000 17188519936 29659392873 49607301096 80696066410
;; small program: (((((((((2 + ((x * x) * x)) * x) * x) + x) div 2) * x) div 2) * x) * x) * x
;; fast program: ((1 + ((2 + ((x * x) * x)) * x)) * ((((x * x) * x) * x) * x)) div (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (* (* (div (* (div (+ (* (* (+ 2 (* (* x x) x)) x) x) x) 2) x) 2) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 (* (+ 2 (* (* x x) x)) x)) (* (* (* (* x x) x) x) x)) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
