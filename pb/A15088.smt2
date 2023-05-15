;; sequence(s): A15088-A15166-A15270-A15322-A15348-A15400-A15426-A15478-A15660-A15712-A15790-A15816-A15946-A15972-A16050-A16128-A16180-A16258
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0
;; small program: if (((x - 1) div (2 + 2)) - 2) <= 0 then 1 else 0
;; fast program: if (x - (2 * (2 + (2 + 2)))) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (- (div (- x 1) (+ 2 2)) 2) 0) 1 0))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- x (* 2 (+ 2 (+ 2 2)))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
