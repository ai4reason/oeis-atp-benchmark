;; sequence(s): A239124
;; terms: 53 117 181 245 309 373 437 501 565 629 693 757 821 885 949 1013 1077 1141 1205 1269
;; small program: loop(2 * ((x + x) + y), 1 + 2, x) - 1
;; fast program: 1 + (2 * (2 + (2 * (2 * (2 + (2 * (2 + (2 * (x + x)))))))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ (+ x x) y)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (+ 2 (* 2 (* 2 (+ 2 (* 2 (+ 2 (* 2 (+ x x)))))))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
