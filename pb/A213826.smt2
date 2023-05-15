;; sequence(s): A213826
;; terms: 2 34 132 332 670 1182 1904 2872 4122 5690 7612 9924 12662 15862 19560 23792 28594 34002 40052 46780
;; small program: (loop(((x + y) + y) + y, 2 + (x + x), 2) * x) + 2
;; fast program: ((1 + (x + x)) * (2 + ((1 + 2) * ((2 + x) * x)))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x y) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ x x)) (+ 2 (* (+ 1 2) (* (+ 2 x) x)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
